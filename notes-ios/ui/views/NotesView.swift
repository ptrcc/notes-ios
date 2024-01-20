//
//  ContentView.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//

import SwiftUI

struct NotesView: View {
    @StateObject var viewModel: ViewModel = ViewModel(repo: NotesRepositoryImpl())
    
    var body: some View {
        NavigationStack {
            NoteList(viewModel: viewModel)
            NotesFooter(viewModel: viewModel)
        }.task {
           await viewModel.loadNotes()
        }
    }
}



#Preview {
    NotesView(
        viewModel: ViewModel(
                repo: NotesRepositoryImpl()
            )
        
    )
}
