//
//  ContentView.swift
//  Bookworm
//
//  Created by Rahul Raoniar on 27/09/2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
  
// Short queries
//    @Query(sort: [
//        SortDescriptor(\Book.title),
//        SortDescriptor(\Book.author)
//    ]) var books: [Book]
    
    
    @State private var showingAddView = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showingAddView = true
                    } label: {
                        Text("Add book")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 20)
                            .background(Color.blue, in: .capsule)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddBookView()
            }
        }
    }
    
    //On delete function
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            
            modelContext.delete(book)
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Book.self, inMemory: true)
}
