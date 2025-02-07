//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Сергей Саченко on 27.01.2025.
//

import SwiftUI

// MARK: -  class of obs theme
class ThemeManager: ObservableObject {
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
//    @Published var isDarkMode: Bool {
//        didSet {
//            UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
//            updateUITheme(isDarkMode: isDarkMode)
//        }
//    }
//    
//    init () {
//        self.isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
//    }
// function for change theme
    
    func updateUITheme() {
        DispatchQueue.main.async {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let window = windowScene.windows.first else { return }
            
            window.overrideUserInterfaceStyle = self.isDarkMode ? .dark : .light
        }
    }
    func toggleTheme() {
        isDarkMode.toggle()
        updateUITheme()
    }
}

@main
struct LandmarksApp: App {
    @StateObject private var themeManager = ThemeManager()
    
    // Add dark/light theme
//    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
                .environmentObject(themeManager)
                .preferredColorScheme(themeManager.isDarkMode ? .dark : .light)
        }
    }
}
