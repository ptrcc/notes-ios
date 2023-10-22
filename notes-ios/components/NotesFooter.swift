//
//  NotesFooter.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//

import SwiftUI

struct NotesFooter: View {
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack {
            if viewModel.notes.count == 1 {
                Text(String(viewModel.notes.count) + " Note")
            } else {
                Text(String(viewModel.notes.count) + " Notes")
            }
            Spacer()
            NavigationLink {
                CreateNoteView(viewModel: viewModel)
            } label: {
                Image(systemName: "square.and.pencil")
                    .accessibilityHint("Add Note")
            }
        }
        .padding()
        .padding([.top, .bottom], 0)
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

