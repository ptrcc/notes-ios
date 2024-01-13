//
//  BaseAPI.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 03.11.23.
//

import Foundation

enum ApiError: Error {
    case wrongRequest
    case parsingError
    case unauthorized
    case notResults
    case serverError(code: Int)
    case unknown
}

class BaseApi {
    func sendRequest<T: Decodable>(url: URL?, apiKey: String, responseModel: T.Type) async -> Result<T, ApiError> {
        guard let url = url else {
            return .failure(.wrongRequest)
        }
        
        do {
            var req = URLRequest(url: url)
            req.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
            
            let (data, response) = try await URLSession.shared.data(for: req, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.notResults)
            }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.parsingError)
                }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.serverError(code: response.statusCode))
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
