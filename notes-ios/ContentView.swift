//
//  ContentView.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//

import SwiftUI


var menu: some View {
    Menu {
        Text("Language")
    } label: {
        Label("Menu", systemImage: "ellipsis.circle")
    }.padding()
}

struct ContentView: View {
    @State var notes = [
        Note(id: UUID(), title:"title1", text:"this is an example text"),
        Note(id: UUID(), title:"title2", text:"this is an example text"),
        Note(id: UUID(), title:"title2", text:"thislk ajsldkfj laksdjf lkjasdk fjksdf lksjdflkjs dlkfjaksld flökj sdlkfjalskdfjlkasjdfkl ajlskdf jlaksjd flkajsldfjaslkdfj lasdfjlkas jdfkl jsdlkfj lksdj fklasjd fklajsd f is an e aölksj dflökas jdfklö asdlökf jaölksdfj lkajsd flkaj dsfölkaj sdflkja sdlkfj alksdfj alksdjf klasjdf lk ajskdf jalksjd flkasj dflkj aslkdfjxample text"),
        Note(id: UUID(), title:"title2", text:"this is an example text"),
        Note(id: UUID(), title:"title2", text:"this is an example text")
    ]

    var body: some View {
        NoteList(notes: notes)
        NotesFooter(sizeOfNotes: notes.count)
    }
}



#Preview {
    ContentView()
}
