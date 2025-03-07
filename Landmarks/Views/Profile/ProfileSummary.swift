//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Lidiia Diachkovskaia on 2/25/25.
//

import SwiftUI


struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(profile.username)
                        .bold()
                        .font(.title)
                    
                    Text("Notifications: \(profile.prefersNoifications ? "On": "Off" )")
                    Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                    Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Completed Badges")
                            .font(.headline)
                            
                        ScrollView(.horizontal) {
                            HStack{
                                HikeBadge(name: "First Hike")
                                HikeBadge(name: "Earth Day")
                                    .hueRotation(Angle(degrees: -90))
                                HikeBadge(name: "tenth Hike")
                                    .grayscale(0.5)
                                    .hueRotation(Angle(degrees: 160))
                            }
                            .padding(.bottom)
                        }
                    }
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Recrent Hikes")
                            .font(.headline)
                        HikeView(hike: modelData.hikes[0])
                    }
                }
            }
        }
    }
}

#Preview {
        ProfileSummary(profile: Profile.draft)
        .environment(ModelData())
    }

