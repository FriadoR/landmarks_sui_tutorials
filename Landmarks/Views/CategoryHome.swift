//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Сергей Саченко on 03.02.2025.
//

import SwiftUI

struct CategoryHome: View {
    
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        
        NavigationSplitView {
            List {
                // Check that the features array is not empty
                if !modelData.features.isEmpty {
                    modelData.features[0].image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .listRowInsets(EdgeInsets())
                }
                // Safely extracting elements from the categories dictionary
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    if let items = modelData.categories[key] {
                        CategoryRow(categoryName: key, items: items)
                    }
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Избранное")
        } detail: {
            Text("Detail")
                .navigationTitle("Category")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}

