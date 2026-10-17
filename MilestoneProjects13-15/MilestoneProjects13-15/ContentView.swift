//
//  ContentView.swift
//  MilestoneProjects13-15
//
//  Created by Rahul Raoniar on 17/10/2026.
//

import SwiftData
import SwiftUI
import PhotosUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Photo.name) private var photos: [Photo]
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhotoData: Data?
    
    @State private var photoName = ""
    @State private var showingPhotoName = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(photos) { photo in
                    NavigationLink {
                        PhotoDetailView(photo: photo)
                    } label: {
                        HStack(spacing: 10) {
                            if let uiImage = UIImage(data: photo.imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                            Text(photo.name)
                                .font(.headline)
                        }
                    }
                    
                    
                }
                
            }
            .toolbar {
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Label("Add photo", systemImage: "plus")
                }
            }
            .onChange(of: selectedItem) { oldValue, newValue in
                Task {
                    if let newValue {
                        do {
                            if let data = try await newValue.loadTransferable(type: Data.self) {
                                selectedPhotoData = data
                                photoName = ""
                                showingPhotoName = true
                            }
                        } catch {
                            print("Failed to load photo: \(error.localizedDescription)")
                        }
                    }
                }
                
            }
            .alert("Name your photo", isPresented: $showingPhotoName) {
                TextField("Photo name", text: $photoName)
                
                Button("Save") {
                    savePhoto()
                }
                .disabled(photoName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                
                Button("Cancel", role: .cancel) {
                    selectedPhotoData = nil
                    selectedItem = nil
                }
            } message: {
                Text("Enter a name for your selected photogrpah.")
            }
        }
    }
    
    func savePhoto() {
        guard let selectedPhotoData else { return }
        
        let trimmedName = photoName.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedName.isEmpty else { return }
        
        let newPhoto = Photo(name: photoName, imageData: selectedPhotoData)
        
        modelContext.insert(newPhoto)
        
        do {
            try modelContext.save()
            
            selectedItem = nil
            self.selectedPhotoData = nil
            photoName = ""
            
        } catch {
            modelContext.delete(newPhoto)
            print("Failed to save photo: \(error.localizedDescription)")
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Photo.self, inMemory: true)
}
