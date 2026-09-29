//
//  User.swift
//  MilestoneProjects10-12
//
//  Created by Rahul Raoniar on 29/09/2026.
//

import Foundation

struct User: Codable, Identifiable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}
