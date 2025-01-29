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
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
            case id, name, park, state, description, isFavorite, imageName,coordinates
        }
    
    private var imageName: String
        var image: Image {
            Image(imageName)
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
            park = try container.decode(String.self, forKey: .park)
            state = try container.decode(String.self, forKey: .state)
            description = try container.decode(String.self, forKey: .description)
            isFavorite = try container.decodeIfPresent(Bool.self, forKey: .isFavorite) ?? false
            isFavorite = try container.decodeIfPresent(Bool.self, forKey: .isFavorite) ?? false
            imageName = try container.decode(String.self, forKey: .imageName)
            coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
        }
}


