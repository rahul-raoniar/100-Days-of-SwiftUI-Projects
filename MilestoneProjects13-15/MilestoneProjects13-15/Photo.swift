//
//  Photo.swift
//  MilestoneProjects13-15
//
//  Created by Rahul Raoniar on 17/10/2026.
//

import Foundation
import SwiftData


@Model
class Photo {
    var name: String
    
    @Attribute(.externalStorage)
    var imageData: Data
    
    init(name: String, imageData: Data) {
        self.name = name
        self.imageData = imageData
    }
}
