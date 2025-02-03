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
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    Text(key)
                }
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
