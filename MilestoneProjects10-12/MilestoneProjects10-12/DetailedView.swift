//
//  DetailedView.swift
//  MilestoneProjects10-12
//
//  Created by Rahul Raoniar on 29/09/2026.
//
import SwiftUI

struct DetailedView: View {
    var user: User
    
    var body: some View {
        List {
            Section("Status") {
                HStack {
                    Text("Status")
                    
                    Spacer()
                    
                    HStack {
                        Circle()
                            .fill(user.isActive ? Color.green : Color.red)
                            .frame(width: 10, height:10)
                        
                        Text(user.isActive ? "Active" : "Inactive")
                    }
                }
            }
            
            Section("Information") {
                LabeledContent("Age") {
                    Text("\(user.age)")
                }
                
                LabeledContent("Company") {
                    Text(user.company)
                }
                
                LabeledContent("Email") {
                    Text(user.email)
                }
                
                LabeledContent("Registered") {
                    Text(
                        user.registered.formatted(
                            date: .abbreviated, time: .omitted
                        )
                    )
                }
            }
            
            Section("Address") {
                Text(user.address)
            }
            
            Section("About") {
                Text(user.about)
            }
            
            Section("Friends") {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
            
            Section("Tags") {
                ForEach(user.tags, id: \.self) { tag in
                    Text(tag)
                }
            }
        }
    }
}



