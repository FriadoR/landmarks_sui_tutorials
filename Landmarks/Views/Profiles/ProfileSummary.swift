//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Сергей Саченко on 04.02.2025.
//

import SwiftUI

struct ProfileSummary: View {
    
//    @AppStorage("isDarkMode") private var isDarkMode = false
    @EnvironmentObject var themeManager: ThemeManager
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
                HStack {
                    Toggle("Сменить тему", isOn: $themeManager.isDarkMode)
                        .toggleStyle(CustomToggleStyle())  // custom
                        .onChange(of: themeManager.isDarkMode) { newValue in
                            themeManager.updateUITheme() // update interface
                        }
                    Spacer() // Отступ слева от текста, чтобы он не сдвигался
                }
                
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
                
                
// MARK: custom toggle struct

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .foregroundColor(.primary)
            Spacer()
            
            // toggle
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color.primary, lineWidth: 2)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(configuration.isOn ? Color.gray : Color.black)
                )
                .frame(width: 50, height: 30)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(3)
                        .offset(x: configuration.isOn ? 13 : -13)
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}
// MARK: END (custom toggle struct)


#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
        .environmentObject(ThemeManager())
}
