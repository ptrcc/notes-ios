//
//  NoteView.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//
import SwiftUI
import UIKit


struct NoteView: View {
    @Binding var note: Note
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TextField("Title", text: $note.title)
                    .font(.title).bold()
                Divider()
                HStack {
                    Image("Apple")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(.blue)
                    Image("Apple")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(.blue)
                    Image("Apple")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(.blue)
                }
                Divider()
                TextEditor(text: $note.text)
                Spacer()
            }
            .padding()
            .padding(.top, 0)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                    }) {
                        Image(systemName: "camera")
                    }
                }
                ToolbarItem {
                    ShareLink(item: URL(string: "https://developer.apple.com/xcode/swiftui/")!)
                }
            }
        }
    }
}


struct NoteView_Previews: PreviewProvider {

    static var previews: some View {
        let sampleNote = Note(id: UUID(), title: "First Note", text: "This is the content of the first note")
        return NoteView(note: .constant(sampleNote))
    }
}
