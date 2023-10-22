//
//  NoteView.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//
import SwiftUI

var noteMenu: some View {
    ShareLink(item: URL(string: "https://developer.apple.com/xcode/swiftui/")!)
}

struct NoteView: View {
    @Binding var note: Note
    
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
            .navigationBarItems(trailing: noteMenu)
        }
    }
}
