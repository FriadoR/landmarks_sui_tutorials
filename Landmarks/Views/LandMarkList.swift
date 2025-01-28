//
//  LandMarkList.swift
//  Landmarks
//
//  Created by Сергей Саченко on 27.01.2025.
//

import SwiftUI

struct LandMarkList: View {
    
    var body: some View {
        
        NavigationSplitView {
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle(Text("Места отдыха"))
        } detail: {
            Text("Detail")
        }
    }
}

#Preview {
    LandMarkList()
}
