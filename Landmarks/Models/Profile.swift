//
//  Profile.swift
//  Landmarks
//
//  Created by Lidiia Diachkovskaia on 2/24/25.
//

import Foundation

struct Profile {
    var username: String
    var prefersNoifications = true
    var seasonalPhoto = Season.winter
    //seasonalPhoto =
    var goalDate = Date()
    
    static let draft = Profile(username: "lidiia")


        enum Season: String, CaseIterable, Identifiable {
            case spring = "🌷"
            case summer = "🌞"
            case autumn = "🍂"
            case winter = "☃️"

            var id: String { rawValue }
        }
}
