//
//  MapView.swift
//  Landmarks
//
//  Created by Сергей Саченко on 27.01.2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
        
        private var region: MKCoordinateRegion {
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: -0.1, longitudeDelta: 0.1))
        }
    }

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
