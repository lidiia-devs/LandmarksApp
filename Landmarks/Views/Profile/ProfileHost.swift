//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Lidiia Diachkovskaia on 2/24/25.
//

import SwiftUI


struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    
    @State private var draftProfile = Profile.draft
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            }
             else {
                 ProfileEditor(profile: $draftProfile)
            }
            
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}

