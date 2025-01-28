//
//  ContentView.swift
//  Landmarks
//
//  Created by Сергей Саченко on 27.01.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
                
        LandMarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
