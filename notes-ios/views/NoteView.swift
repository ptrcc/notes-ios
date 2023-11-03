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
    @ObservedObject var viewModel: ViewModel
    
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
                ToolbarItem {
                    Menu {
                        Button(action: {
                            Task {
                                let url = URL(string: "https://api.api-ninjas.com/v1/quotes")
                                let api: BaseApi = BaseApi()
                                let response: Result<[Quote], ApiError> = try await api.sendRequest(
                                    url: url,
                                    apiKey: "apikey", // TODO use environment
                                    responseModel: [Quote].self
                                )
                                switch response {
                                case .success(let result):
                                    print("Successfully retrieved quote: \(result[0].quote)")
                                    viewModel.updateNote(note: note, text: note.text + "\n\n" + result[0].description)
                                case .failure(let error):
                                    print("Error retrieving a quote: \(error)")
                                }
                            }
                        }, label: {
                            Text("Add quote")
                        })
                    }label: {
                        Label("Menu", systemImage: "ellipsis.circle")
                    }.padding()
                }
            }
        }
    }
}


