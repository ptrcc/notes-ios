//
//  notes_iosApp.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//

import SwiftUI
import Combine

@main
struct notes_iosApp: App {
    
    var viewModel = ViewModel(
            repo: NotesRepositoryImpl()
        
    )
    
    var body: some Scene {
        WindowGroup {
            NotesView(viewModel: viewModel)
                .environment(\.locale, .init(identifier: "en"))
            .task {
                await viewModel.refreshNotes()
            }
            
        }
    }
}
