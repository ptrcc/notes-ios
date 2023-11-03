//
//  DataRepository.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 22.10.23.
//

import Foundation
import Combine

protocol NotesRepository {
    func fetchNotes() -> [Note]
    func storeNote(note: Note)
    func deleteNote(note: Note)
    func updateNote(note: Note, text: String)
}

class NotesRepositoryImpl: NotesRepository {
    var notes =  [
        Note(id: UUID(), title:"First Note", text:"This is the content of the first note"),
        Note(id: UUID(), title:"Second Note", text:"This is the content of the second note"),
        Note(id: UUID(), title:"Short Note", text:"Very short content"),
        Note(id: UUID(), title:"Long Note", text:"Very long content hello world hello world hello world hello world hello world hello world hello world"),
        Note(id: UUID(), title:":)", text:"If you read this, be happy :)")
    ]
    
    func storeNote(note: Note) {
        notes.insert(note, at: 0)
    }
    
    func deleteNote(note: Note) {
        if let index = findNodeIdx(note: note) {
            notes.remove(at: index)
        }
    }
    
    func updateNote(note: Note, text: String) {
        if let index = findNodeIdx(note: note) {
            notes[index].text = text
        }
    }
    
    func fetchNotes() -> [Note] {
        return notes
    }
    
    private func findNodeIdx(note: Note) -> Int? {
        return notes.firstIndex(where: {$0.id == note.id})
    }
}
