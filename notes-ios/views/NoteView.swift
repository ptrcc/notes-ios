//
//  NoteView.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//
import SwiftUI

struct NoteView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Note Title")
                    .font(.title)
                Divider()
                Text("This is a note content.")
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    NoteView()
}
