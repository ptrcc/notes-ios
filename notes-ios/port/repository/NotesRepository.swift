//
//  NotesRepository.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 13.01.24.
//

import Foundation

protocol NotesRepository {
    func fetchNotes() async -> [Note]
    func persist(notes: [Note]) async
}
