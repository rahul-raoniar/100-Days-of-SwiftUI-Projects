//
//  ContentView.swift
//  BasicOrder
//
//  Created by Rahul Raoniar on 23/09/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var order = Order()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cup cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 1...20)
                }
                
                Section {
                    Toggle("Any special request", isOn: $order.specialRequestEnabled)
                    
                    if order.specialRequestEnabled == true {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinklers", isOn: $order.addSprinklers)
                    }
                }
                
                Section {
                    NavigationLink("Delivery Address") {
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("CupCakeCorner")
        }
    }
}

#Preview {
    ContentView()
}
