//
//  AddActivityView.swift
//  Day47Challenge
//
//  Created by Rahul Raoniar on 20/09/2026.
//

import SwiftUI

struct AddActivityView: View {
    var activities: Activities
    
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        Form {
            TextField("Activity title", text: $title)
            
            TextField("Description", text: $description)
        }
        .navigationTitle("Add activity")
        .navigationBarBackButtonHidden()
        
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    let newActivity = Activity(title: title, description: description)
                    activities.items.append(newActivity)
                    
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddActivityView(activities: Activities())
}
