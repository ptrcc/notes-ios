//
//  ContentView.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//

import SwiftUI

struct NotesView: View {
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            NoteList(viewModel: viewModel)
            NotesFooter(viewModel: viewModel)
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
