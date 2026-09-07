//
//  ContentView.swift
//  WeSplit
//
//  Created by Rahul Raoniar on 25/05/2026.


import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numerOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountFocused: Bool
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount * (tipSelection/100)
        let grantTotal = checkAmount + tipValue
        return grantTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numerOfPeople + 2)
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                        .keyboardType(.decimalPad)
                        .focused($amountFocused)
                    
                    Picker("Number of people", selection: $numerOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }
                
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<100) {
                            Text($0, format: .percent)
                        }
                    }
                }.pickerStyle(.navigationLink)
                
                Section("Total amount for the check") {
                    Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                }
                
                Section("Amount Per Person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountFocused {
                    Button("Done") {
                        amountFocused = false
                    }
                }
            }
        }
    }
    }

#Preview {
    ContentView()
}
