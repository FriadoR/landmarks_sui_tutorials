//
//  Landmark.swift
//  Landmarks
//
//  Created by Сергей Саченко on 27.01.2025.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var location: String
    var state: String
    var description: String
    var isFavorite: Bool = false
    var category: Category
    var isFeatured: Bool = false
    
    enum Category: String, CaseIterable, Codable {
        case park = "Парки"
        case castle = "Дворцы"
        case temple = "Храмы"
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, location, state, description, isFavorite, imageName, coordinates, category, isFeatured
    }
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var featureImage: Image? {
        if isFeatured {
                print("Looking for image: \(imageName)_feature")
                return Image(imageName + "_feature")
            }
            return nil
        }
    
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        location = try container.decode(String.self, forKey: .location)
        state = try container.decode(String.self, forKey: .state)
        description = try container.decode(String.self, forKey: .description)
        isFavorite = try container.decodeIfPresent(Bool.self, forKey: .isFavorite) ?? false
        imageName = try container.decode(String.self, forKey: .imageName)
        coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
        category = try container.decode(Landmark.Category.self, forKey: .category)
        isFeatured = try container.decodeIfPresent(Bool.self, forKey: .isFeatured) ?? false
    }
}


