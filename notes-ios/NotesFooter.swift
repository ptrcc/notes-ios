//
//  NotesFooter.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//

import SwiftUI

struct NotesFooter: View {
    var sizeOfNotes: Int
    
    var body: some View {
        HStack {
            // TODO center text
            Text(String(sizeOfNotes) + " Notes")
                .font(.caption)
            Spacer()
            Button("", systemImage: "square.and.pencil") {
                // TODO Action
            }.accessibilityHint("Add Note")
        }.padding([.leading, .trailing], 20)
    }
}
