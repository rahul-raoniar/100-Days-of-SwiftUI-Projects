//
//  AddView.swift
//  Day38iExpenseWrapup
//
//  Created by Rahul Raoniar on 08/09/2026.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Personal", "Business"]
    
    @Environment(\.dismiss) var dismiss
    
    var expenses: Expenses
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                    Text("\($0)")
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .foregroundStyle(amountColor(for: amount))
            }
            .navigationTitle("Add New Expense")
        }
        
        Button("Save") {
            let expense = ExpenseItems(name: name, type: type, amount: amount)
            expenses.items.append(expense)
            
            dismiss()
        }
    }
    
    func amountColor(for amount: Double) -> Color {
        if amount < 10 {
            return Color.red
        } else if amount < 100 {
            return Color.yellow
        } else {
            return Color.green
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
