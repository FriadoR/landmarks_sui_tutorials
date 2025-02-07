//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Сергей Саченко on 27.01.2025.
//

import SwiftUI

// MARK: -  class of obs
class ThemeManager: ObservableObject {
    @Published var isDarkMode: Bool {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
        }
    }
    init () {
        self.isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
    }
}

@main
struct LandmarksApp: App {
    @StateObject private var themeManager = ThemeManager()
    
    // Add dark/light theme
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
                .environmentObject(themeManager)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
