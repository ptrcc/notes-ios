//
//  Note.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//

import Foundation

struct Note: Identifiable, Codable {
    var id: UUID
    var title: String
    var text: String
    var images: [Data] = []
}
