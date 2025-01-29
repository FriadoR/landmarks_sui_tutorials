//
//  LandMarkList.swift
//  Landmarks
//
//  Created by Сергей Саченко on 27.01.2025.
//

import SwiftUI

struct LandMarkList: View {
    
<<<<<<< HEAD
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
=======
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
            landmarks.filter { landmark in
>>>>>>> origin/main
                (!showFavoritesOnly || landmark.isFavorite)
            }
        }
    
    var body: some View {
        
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                                    Text("Избранные места")
                                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle(Text("Места отдыха"))
        } detail: {
            Text("Detail")
        }
    }
}

#Preview {
    LandMarkList()
        .environment(ModelData())
}
