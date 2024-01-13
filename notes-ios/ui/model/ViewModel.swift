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
    private var repo: NotesRepository

    init(repo: NotesRepository) {
        self.repo = repo
    }
    
    func refreshNotes() async {
        let notes = await repo.fetchNotes()
        await MainActor.run {
            self.notes = notes
        }
    }
    
    func persist() async {
        await self.repo.persist(notes: notes)
    }
    
    func addNote(note: Note) async {
        self.notes.insert(note, at: 0)
        await self.persist()
    }
    
    func removeNote(note: Note) async {
        if let index = findNodeIdx(note: note) {
            notes.remove(at: index)
        }
        await self.persist()
    }
    
    private func findNodeIdx(note: Note) -> Int? {
        return notes.firstIndex(where: {$0.id == note.id})
    }
}
