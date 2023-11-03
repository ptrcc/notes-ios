//
//  Quote.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 03.11.23.
//

import Foundation

struct Quote: Decodable, CustomStringConvertible {
    var quote: String
    var author: String
    var category: String
    
    var description: String {
        return "\(quote)\n -\(author)"
    }
}
