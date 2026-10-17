//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Rahul Raoniar on 27/09/2026.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
