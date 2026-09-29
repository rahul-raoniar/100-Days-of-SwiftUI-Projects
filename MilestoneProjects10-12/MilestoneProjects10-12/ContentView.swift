//
//  ContentView.swift
//  MilestoneProjects10-12
//
//  Created by Rahul Raoniar on 29/09/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink {
                    DetailedView(user: user)
                } label: {
                    HStack {
                        Circle()
                            .fill(user.isActive ? Color.green : Color.red)
                            .frame(width: 10, height: 10)
                        
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.isActive ? "Active" : "Inactive")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("FriendFace")
        }
        .task {
            if users.isEmpty {
                await loadData()
            }
        }
    }
    
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedUsers = try decoder.decode([User].self, from: data)
            users = decodedUsers
            
            print("Downloaded \(decodedUsers.count) users")
        } catch {
            print("Failed to load data: \(error.localizedDescription)")
        }
        
    }
    
}

#Preview {
    ContentView()
}
