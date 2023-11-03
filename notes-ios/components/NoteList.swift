//
//  NotesGrid.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//

import SwiftUI

var menu: some View {
    Menu {
        Text("Language")
    } label: {
        Label("Menu", systemImage: "ellipsis.circle")
    }.padding()
}

struct NoteList: View {

    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List($viewModel.notes) { $item in
            NavigationLink {
                NoteView(note: $item, viewModel: viewModel)
            } label: {
                NoteRow(note: item)
                    .swipeActions(allowsFullSwipe: false) {
                        Button(role: .destructive) {
                            viewModel.removeNote(note: item)
                            print("Remove Note")
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                    }
            }
        }
        .navigationTitle("All Notes")
        .navigationBarItems(trailing: menu)
    }
}

#Preview {
    NotesView(
        viewModel: ViewModel(
            service: NotesServiceImpl(
                repository: NotesRepositoryImpl()
            )
        )
    )
}
