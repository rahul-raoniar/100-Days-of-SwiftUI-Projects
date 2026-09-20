//
//  ContentView.swift
//  Day38iExpenseWrapup
//
//  Created by Rahul Raoniar on 08/09/2026.
//

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
    
    var personalExpenses : [ExpenseItems] {
        expenses.items.filter {
            $0.type == "Personal"
        }
    }
    
    var businessExpenses: [ExpenseItems] {
        expenses.items.filter {
            $0.type == "Business"
        }
    }
    
    var body: some View {
    NavigationStack {
        List {
            Section("Personal") {
                ForEach(personalExpenses) { item in
                        HStack {
                            Text(item.name)
                            
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
                .onDelete { offsets in
                    removeItem(at: offsets, from: personalExpenses)
                }
            }
            
            Section("Business") {
                ForEach(businessExpenses) { item in
                    HStack {
                        Text(item.name)
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                    
                }
                .onDelete { offsets in
                    removeItem(at: offsets, from: businessExpenses)
                }
            }
            
          }
        .navigationTitle("iExpense")
        .toolbar {
            NavigationLink {
                AddView(expenses: expenses)
            } label: {
                Label("Add Expense", systemImage: "plus")
            }
        }
        
      }
        
    }
    
    func removeItem(at offsets: IndexSet, from filteredItems: [ExpenseItems]) {
        for offset in offsets {
            let item = filteredItems[offset]
            expenses.items.removeAll { expense in
                expense.id == item.id
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}

