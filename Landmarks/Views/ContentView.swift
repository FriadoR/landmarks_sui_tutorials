//
//  ContentView.swift
//  Landmarks
//
//  Created by Сергей Саченко on 27.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var themeManager: ThemeManager
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Избранное", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("Список", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        .navigationBarItems(trailing: Toggle(isOn: $themeManager.isDarkMode) {
            Text("Тема")
        })
        .preferredColorScheme(themeManager.isDarkMode ? .dark : .light)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
        .environmentObject(ThemeManager())
}
