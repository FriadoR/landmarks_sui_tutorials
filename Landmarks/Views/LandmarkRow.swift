//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Сергей Саченко on 27.01.2025.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            Text(landmark.name)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                    .padding()
            }
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
        return Group {
        LandmarkRow(landmark:  landmarks[0])
        LandmarkRow(landmark:  landmarks[1])
    }
}

