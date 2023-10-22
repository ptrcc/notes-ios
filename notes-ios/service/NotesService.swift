//
//  NotesService.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 22.10.23.
//

import Combine

protocol NotesService {
    func getNotes() -> [Note]
    func addNote(note: Note)
    func deleteNote(note: Note)
}

class NotesServiceImpl: NotesService {
    
    private let repository: NotesRepository

    init(repository: NotesRepository) {
        self.repository = repository
    }

    func getNotes() -> [Note] {
        return repository.fetchNotes()
    }
    
    func addNote(note: Note) {
        repository.storeNote(note: note)
    }
    
    func deleteNote(note: Note) {
        self.repository.deleteNote(note: note)
    }
    
}

