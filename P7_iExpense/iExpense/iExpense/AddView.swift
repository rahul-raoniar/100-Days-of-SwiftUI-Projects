//
//  AddView.swift
//  iExpense
//
//  Created by Rahul Raoniar on 07/09/2026.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text("\($0)")
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
                
                
            }
            .navigationTitle("Add new expense")
            
            
            Button("Save") {
                let item = ExpenseItems(name: name, type: type, amount: amount)
                expenses.items.append(item)
                dismiss()
            }
            
            
            
        }
        
        
    }
}

#Preview {
    AddView(expenses: Expenses())
}
