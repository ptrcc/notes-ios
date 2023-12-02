//
//  NotesService.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 22.10.23.
//

import Combine

protocol NotesService {
    func getNotes() async -> [Note]
    func persist() async
}

class NotesServiceImpl: NotesService {
    
    private let repository: NotesRepository

    init(repository: NotesRepository) {
        self.repository = repository
    }

    func getNotes() async -> [Note] {
        return await repository.fetchNotes()
    }
    
    func persist() async {
        await repository.persist()
    }
}

