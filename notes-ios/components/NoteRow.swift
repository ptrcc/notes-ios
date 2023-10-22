//
//  NoteCell.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//

import SwiftUI

struct NoteRow: View {
    var note: Note
    
    var body: some View {
        VStack(alignment:.leading) {
            Text(note.title).bold()
            Text(note.text)
        }
    }
}


#Preview {
    NotesView()
}
