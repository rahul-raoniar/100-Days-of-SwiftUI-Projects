//
//  Activity.swift
//  Day47Challenge
//
//  Created by Rahul Raoniar on 20/09/2026.
//

import Foundation

struct Activity: Identifiable, Codable {
    var id = UUID()
    
    let title: String
    let description: String
    
    var completionCount = 0
}
