//
//  CreateNoteView.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 22.10.23.
//

import SwiftUI

struct CreateNoteView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var note: Note = Note(id: UUID(), title: "", text: "")
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var createNoteMenu: some View {
        Button("Create") {
            Task {
                await self.viewModel.addNote(note:note)
                self.mode.wrappedValue.dismiss()
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TextField("Title", text: $note.title)
                    .font(.title).bold()
                Divider()
                TextEditor(text: $note.text)
                Spacer()
            }
            .padding()
            .padding(.top, 0)
            
            .navigationBarItems(
                trailing: createNoteMenu
            )
        }
    }
}

