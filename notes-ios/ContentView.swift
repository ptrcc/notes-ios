//
//  ContentView.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//

import SwiftUI

var notes = [
    Note(id: 0, title:"title1", text:"this is an example text"),
    Note(id: 1, title:"title2", text:"this is an example text"),
    Note(id: 2, title:"title2", text:"thislk ajsldkfj laksdjf lkjasdk fjksdf lksjdflkjs dlkfjaksld flökj sdlkfjalskdfjlkasjdfkl ajlskdf jlaksjd flkajsldfjaslkdfj lasdfjlkas jdfkl jsdlkfj lksdj fklasjd fklajsd f is an e aölksj dflökas jdfklö asdlökf jaölksdfj lkajsd flkaj dsfölkaj sdflkja sdlkfj alksdfj alksdjf klasjdf lk ajskdf jalksjd flkasj dflkj aslkdfjxample text"),
    Note(id: 3, title:"title2", text:"this is an example text"),
    Note(id: 4, title:"title2", text:"this is an example text")
]

var menu: some View {
    Menu {
        Text("Language")
    } label: {
        Label("Menu", systemImage: "ellipsis.circle")
    }.padding()
}

struct ContentView: View {
    var body: some View {
        NoteList(notes: notes)
        NotesFooter(sizeOfNotes: notes.count)
    }
}



#Preview {
    ContentView()
}
