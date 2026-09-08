//
//  ContentView.swift
//  iExpense
//
//  Created by Rahul Raoniar on 06/09/2026.
//


///*
// Building a list we can delete form
// */
//import SwiftUI
//
//struct ExpenseItems {
//    let name: String
//    let type: String
//    let amount: Double
//}
//
//@Observable
//class Expenses {
//    var items = [ExpenseItems]()
//}
//
//struct ContentView: View {
//    @State private var expenses = Expenses()
//   
//            
//            var body: some View {
//                
//                NavigationStack {
//                    List {
//                        ForEach(expenses.items, id: \.name) { item in
//                            Text("\(item.name)")
//                        }
//                        .onDelete(perform: removeItem)
//                    }
//                        
//                    
//                    .navigationTitle("iExpense")
//                    .toolbar {
//                        Button("Add expense", systemImage: "plus") {
//                            let expense = ExpenseItems(name: "Test", type: "Personal", amount: 5)
//                            expenses.items.append(expense)
//                        }
//                    }
//                }
//        
//    }
//    
//    func removeItem(at offsets: IndexSet) {
//        expenses.items.remove(atOffsets: offsets)
//    }
//}
//
//#Preview {
//    ContentView()
//}


///*
//Working with identifiable items
//*/
//
////The requirement is to add "Identifiable" protocol is to have a unique identifier "id" which uniquely identify each items in loop and other places so now after adding Identifiable we won't need to provide id: \.id
////The Identifiable and id = UUID now identify it in the struct
////UUID() generates unique identifiers
//
//import SwiftUI
//
//struct ExpenseItems: Identifiable {
//    let id = UUID()
//    let name: String
//    let type: String
//    let amount: Double
//}
//
//@Observable
//class Expenses {
//    var items = [ExpenseItems]()
//}
//
//struct ContentView: View {
//    @State private var expenses = Expenses()
//   
//            
//            var body: some View {
//                
//                NavigationStack {
//                    List {
//                        ForEach(expenses.items) { item in
//                            Text("\(item.name)")
//                        }
//                        .onDelete(perform: removeItem)
//                    }
//                    .navigationTitle("iExpense")
//                    .toolbar {
//                        Button("Add expense", systemImage: "plus") {
//                            let expense = ExpenseItems(name: "Test", type: "Personal", amount: 5)
//                            expenses.items.append(expense)
//                        }
//                    }
//                }
//        
//    }
//    
//    func removeItem(at offsets: IndexSet) {
//        expenses.items.remove(atOffsets: offsets)
//    }
//}
//
//#Preview {
//    ContentView()
//}



/*
- Sharing an observed object with a new view
- Add a new View called AddView
 */

import SwiftUI

struct ExpenseItems: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItems]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
        init() {
            if let savedItems = UserDefaults.standard.data(forKey: "Items") {
                if let decodedItems = try? JSONDecoder().decode([ExpenseItems].self, from: savedItems) {
                    items = decodedItems
                    return
                }
            }
            items = []
        }
}


struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) {item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                    
                    
                    
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
            
        }
        
        
    }
    
    func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}


#Preview {
    ContentView()
}
