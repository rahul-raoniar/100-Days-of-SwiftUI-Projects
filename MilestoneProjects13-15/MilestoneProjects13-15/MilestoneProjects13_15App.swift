//
//  MilestoneProjects13_15App.swift
//  MilestoneProjects13-15
//
//  Created by Rahul Raoniar on 17/10/2026.
//
import SwiftData
import SwiftUI

@main
struct MilestoneProjects13_15App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Photo.self)
    }
}
