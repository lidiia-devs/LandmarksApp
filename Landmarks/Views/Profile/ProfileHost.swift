//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Lidiia Diachkovskaia on 2/24/25.
//

import SwiftUI


struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @State private var draftProfile = Profile.draft
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}

