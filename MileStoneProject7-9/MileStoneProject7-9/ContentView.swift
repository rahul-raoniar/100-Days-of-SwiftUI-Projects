//
//  ContentView.swift
//  Day47Challenge
//
//  Created by Rahul Raoniar on 20/09/2026.


import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(activities.items) { activity in
                    NavigationLink {
                        ActivityDetailedView(activity: activity, activities: activities)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(activity.title)
                                .font(.headline)
                            
                            Text(activity.description)
                                .foregroundStyle(.secondary)
                            
                            Text("Completed \(activity.completionCount) times")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                }
                
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink {
                        AddActivityView(activities: activities)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
