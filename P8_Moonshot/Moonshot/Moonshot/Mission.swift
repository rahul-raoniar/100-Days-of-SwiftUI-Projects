//
//  Mission.swift
//  Moonshot
//
//  Created by Rahul Raoniar on 12/09/2026.
//

import Foundation


struct Mission: Codable, Identifiable {
    struct crewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [crewRole]
    let description: String
    
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    
    var formattedlaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "NA"
    }
}
