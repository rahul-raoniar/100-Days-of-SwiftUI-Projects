//
//  Bundle_Decodable.swift
//  Moonshot
//
//  Created by Rahul Raoniar on 12/09/2026.

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate the \(file) in the bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        let formater = DateFormatter()
        formater.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formater)
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' - '\(context.debugDescription)'")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) due to type mismatch - '\(context.debugDescription)'")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to load \(file) due to missing - \(type) - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) due to an unknown error - \(error.localizedDescription)")
        }
        
    }
}
