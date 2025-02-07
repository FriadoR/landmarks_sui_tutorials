//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Сергей Саченко on 04.02.2025.
//

import SwiftUI

struct ProfileSummary: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @EnvironmentObject var ThemeManager: ThemeManager
    @Environment(ModelData.self) var modelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Уведомления: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Сезонный стикер: \(profile.seasonalPhoto.rawValue)")
                Text("Дата посещения: ") + Text(profile.goalDate, style: .date)
                Toggle("Использовать тёмную тему", isOn: $ThemeManager.isDarkMode)
                    .onChange(of: ThemeManager.isDarkMode) { newValue in
                            withAnimation {
                                UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = ThemeManager.isDarkMode ? .dark : .light
                        }
                    }
                    .background(Color(.systemBackground)) // Меняет цвет в зависимости от темы
                    
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Полученные достижения")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "Первый поход")
                            HikeBadge(name: "День Земли")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Десятый Поход")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Недавний поход")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
