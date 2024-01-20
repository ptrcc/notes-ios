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
            
            if (note.images.count == 1) {
                Text("\(note.images.count) Image").font(.caption2).foregroundStyle(.gray)
            }
            else if (note.images.count > 1) {
                Text("\(note.images.count) Images").font(.caption2).foregroundStyle(.gray)
            }
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
