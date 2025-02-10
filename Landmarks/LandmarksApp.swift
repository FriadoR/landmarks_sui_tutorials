//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Сергей Саченко on 27.01.2025.
//

import SwiftUI

class ThemeManager: ObservableObject {
    @Published var isDarkMode: Bool {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
        }
    }
    
    init() {
        self.isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
    }
    
    func toggleTheme() {
        isDarkMode.toggle()
    }
}

@main

struct LandmarksApp: App {
    @StateObject private var themeManager = ThemeManager()
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
                ContentView()
                    .environment(modelData)
                    .environmentObject(themeManager)
        }
    }
}
