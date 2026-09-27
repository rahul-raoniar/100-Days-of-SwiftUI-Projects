//
//  AddBookView.swift
//  Bookworm
//
//  Created by Rahul Raoniar on 27/09/2026.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Form {
                    Section {
                        TextField("Name of book", text: $title)
                        TextField("Author's name", text: $author)
                        
                        Picker("Genre", selection: $genre) {
                            ForEach(genres, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    
                    Section("Write a review") {
                        TextEditor(text: $review)
                        
                        RatingView(rating: $rating)
                    }
                }
                Button {
                    let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                    modelContext.insert(newBook)
                    
                    dismiss()
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 15)
                        .background(Color.blue, in: Capsule())
                }
                .buttonStyle(.plain)
                .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                
            }
            .navigationTitle("Add book")
        }
    }
}


#Preview {
    AddBookView()
        .modelContainer(for: Book.self, inMemory: true)
}
