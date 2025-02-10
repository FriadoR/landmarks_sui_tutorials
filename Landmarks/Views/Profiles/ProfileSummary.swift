//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Сергей Саченко on 04.02.2025.
//

import SwiftUI

struct ProfileSummary: View {
    
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
        .environmentObject(ThemeManager())
        .environment(ModelData())
}
