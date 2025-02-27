//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Сергей Саченко on 03.02.2025.
//

import SwiftUI

struct CategoryItem: View {
    
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .font(.caption)
        }
        .padding(.leading, 15)
        .aspectRatio(3 / 2, contentMode: .fit)
        .clipShape(.rect(cornerRadius: 15))
        .contentShape(.rect)
        .scrollTransition { content, phase in content
                .opacity(phase.isIdentity ? 1 : 0.9)
                .scaleEffect(phase.isIdentity ? 1 : 0.9)
                .blur(radius: phase.isIdentity ? 0 : 1)
                .rotationEffect(.degrees(phase.value * 5))
        }
    }
}


#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
