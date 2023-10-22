//
//  NotesGrid.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//

import SwiftUI

struct NoteList: View {

    @State var notes: [Note]
    
    var body: some View {
        NavigationStack {
            EditableList($notes) { $item in
                NavigationLink {
                    NoteView()
                } label: {
                    NoteRow(note: item)
                        .swipeActions(allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                print("Deleting note")
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                        }
                }
           }
            .navigationTitle("Notes")
            .navigationBarItems(trailing: menu)
        }
    }
}

#Preview {
    NotesView()
}
