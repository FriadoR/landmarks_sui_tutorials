//
//  ModelData.swift
//  Landmarks
//
//  Created by Сергей Саченко on 27.01.2025.
//

import Foundation

@Observable
 class ModelData {
     
     var landmarks: [Landmark] = load("landmarkData.json")
     var hikes: [Hike] = load("hikeData.json")
     var profile = Profile.default
     
     var features: [Landmark] {
         landmarks.filter { $0.isFeatured }
     }
     
     var categories: [String: [Landmark]] {
         Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
         )
     }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        // whats wrong with u ?
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    } catch let decodingError {
        // print some error
        print("Error decoding \(filename): \(decodingError)")
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(decodingError)")
    }
}
