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
}

class NotesRepositoryImpl: NotesRepository {
    var notes =  [
        Note(id: UUID(), title:"title1", text:"this is an example text"),
        Note(id: UUID(), title:"title2", text:"this is an example text"),
        Note(id: UUID(), title:"title2", text:"thislk ajsldkfj laksdjf lkjasdk fjksdf lksjdflkjs dlkfjaksld flökj sdlkfjalskdfjlkasjdfkl ajlskdf jlaksjd flkajsldfjaslkdfj lasdfjlkas jdfkl jsdlkfj lksdj fklasjd fklajsd f is an e aölksj dflökas jdfklö asdlökf jaölksdfj lkajsd flkaj dsfölkaj sdflkja sdlkfj alksdfj alksdjf klasjdf lk ajskdf jalksjd flkasj dflkj aslkdfjxample text"),
        Note(id: UUID(), title:"title2", text:"this is an example text"),
        Note(id: UUID(), title:"title2", text:"this is an example text")
    ]
    
    func storeNote(note: Note) {
        notes.insert(note, at: 0)
    }
    
    func deleteNote(note: Note) {
        if let index = notes.firstIndex(where: {$0.id == note.id}) {
            notes.remove(at: index)
        }
    }
    
    func fetchNotes() -> [Note] {
        return notes
    }
}
