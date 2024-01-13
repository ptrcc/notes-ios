//
//  NotesGrid.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//

import SwiftUI


struct NoteList: View {

    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        List($viewModel.notes) { $item in
            NavigationLink {
                NoteView(note: $item)
                    .onDisappear {
                        Task {
                            await viewModel.persist()
                        }
                    }
            } label: {
                NoteRow(note: item)
                    .swipeActions(allowsFullSwipe: false) {
                        Button(role: .destructive) {
                            Task {
                                await viewModel.removeNote(note:item)
                                print("Remove Note")
                            }
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                    }
            }
        }
        .navigationTitle("All Notes")
    }
}

#Preview {
    NotesView(
        viewModel: ViewModel(
            
                repo: NotesRepositoryImpl()
            )
        
    )
}
