//
//  Activities.swift
//  Day47Challenge
//
//  Created by Rahul Raoniar on 20/09/2026.
//

import Foundation
import Observation

@Observable
class Activities {
    var items = [Activity]() {
        
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                items = decodedItems
                return
            }
            
            items = []
        }
        
    }
    
}
