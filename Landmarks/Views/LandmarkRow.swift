//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Lidiia Diachkovskaia on 2/14/25.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 70, height: 70)
            
                Text("\(landmark.name) |")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(0)
                Text(landmark.state)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                
                if landmark.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                        
            }
            Spacer()
        }
    }
}

#Preview {
    Group{
        LandmarkRow(landmark: landmarks[3])
        LandmarkRow(landmark: landmarks[5])
        LandmarkRow(landmark: landmarks[0])
    }
}
