//
//  NoteView.swift
//  notes-ios
//
//  Created by Patrick Arbeiter on 21.10.23.
//
import SwiftUI
import UIKit
import PhotosUI


struct NoteView: View {
    @Binding var note: Note
    @ObservedObject var viewModel: ViewModel
    
    @State private var selectedPhotos = [PhotosPickerItem]()
    @State private var showCamera = false
    @State private var selectedImage: UIImage?

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TextField("Title", text: $note.title)
                    .font(.title).bold()
                if !note.images.isEmpty {
                    Divider()
                    HStack {
                        ScrollView(.horizontal) {
                            LazyHStack{
                                ForEach(note.images, id: \.self) { data in
                                    if let uiImage = UIImage(data: data) {
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 90, height: 90)
                                    }
                                }
                            }
                        }
                    }.frame(height: 100)
                }
                
                Divider()
                TextEditor(text: $note.text)
                Spacer()
            }
            .padding()
            .padding(.top, 0)
            .onChange(of: selectedPhotos) { _, result in
                note.images.removeAll()
                Task {
                    for photo in selectedPhotos {
                        do {
                            if let data = try await photo.loadTransferable(type: Data.self) {
                                if let uiImage = UIImage(data: data) {
                                    
                                    note.images.append(data)
                                }
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            .onDisappear {
                Task {
                    print(note.text)
                    await self.viewModel.persist()
                }
            }
            .toolbar {
                ToolbarItem {
                    Button("Take photo") {
                        self.showCamera.toggle()
                    }
                    .fullScreenCover(isPresented: self.$showCamera) {
                        accessCameraView(selectedImage: self.$selectedImage)
                    }
                }

                ToolbarItem {
                    ShareLink(item: note.text)
                }
                
                ToolbarItem {
                    PhotosPicker(selection: $selectedPhotos, matching: .images) {
                        Image(systemName: "camera")
                    }
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
                                    var q = result[0].description
                                    await viewModel.persist()
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


struct accessCameraView: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

// Coordinator will help to preview the selected image in the View.
class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: accessCameraView
    
    init(picker: accessCameraView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
}

