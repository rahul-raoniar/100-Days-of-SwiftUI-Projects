//
//  ActivityDetailedView.swift
//  Day47Challenge
//
//  Created by Rahul Raoniar on 20/09/2026.
//

import SwiftUI

struct ActivityDetailedView: View {
    let activity: Activity
    var activities: Activities
    
    var currentActivity: Activity {
        activities.items.first { item in
            item.id == activity.id
        } ?? activity
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Text(currentActivity.description)
                .font(.title3)
            
            Text("Completed \(currentActivity.completionCount) times")
                .font(.headline)
            
            Button("Marked as Completed") {
                if let index = activities.items.firstIndex(where: {$0.id == activity.id})
                {
                    activities.items[index].completionCount += 1
                }
            }
            .buttonStyle(.borderedProminent)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        if let index = activities.items.firstIndex(where: {$0.id == activity.id})
                        {
                            activities.items[index].completionCount = 0
                        }
                    } label: {
                        Label("Reset", systemImage: "arrow.counterclockwise")
                    }
                }
            }
            
            Spacer()
            Spacer()
            
        }
        .padding()
        .navigationTitle(currentActivity.title)
//        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    ActivityDetailedView(activity: Activity(title: "Swimming", description: "Swimming from tommorow"), activities: Activities())
}
