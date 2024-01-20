//
//  HttpApi.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 19.01.24.
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

protocol HttpClient {
    func sendRequest<T: Decodable>(url: URL?, apiKey: String, responseModel: T.Type) async -> Result<T, ApiError>
}
