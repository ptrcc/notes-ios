//
//  ViewModel.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 22.10.23.
//

import Combine
import Foundation

class ViewModel: ObservableObject {
    @Published var notes: [Note] = []
    private var service: NotesService

    init(service: NotesService) {
        self.service = service
        self.notes = service.getNotes()
    }
    
    func refreshNotes() {
        self.notes = service.getNotes()
    }
    
    func removeNote(note: Note) {
        self.service.deleteNote(note: note)
        refreshNotes()
    }
    
    func addNote(note: Note) {
        self.service.addNote(note: note)
        refreshNotes()
    }
}
