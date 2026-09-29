//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Rahul Raoniar on 28/09/2026.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
