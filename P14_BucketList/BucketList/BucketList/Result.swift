//
//  Results.swift
//  BucketList
//
//  Created by Rahul Raoniar on 07/10/2026.


import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    var description: String {
        terms?["description"]?.first ?? "No further description"
    }
    
    static func <(lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
}

/*
 How the JSON looks like
 */
//{
//  "query": {
//    "pages": {
//      "123456": {
//        "pageid": 123456,
//        "title": "Example place",
//        "coordinates": [
//          {
//            "lat": 19.0,
//            "lon": 72.8
//          }
//        ],
//        "thumbnail": {
//          "source": "https://upload.wikimedia.org/...",
//          "width": 500,
//          "height": 333
//        },
//        "terms": {
//          "description": ["A short description of the place"]
//        }
//      }
//    }
//  }
//}
