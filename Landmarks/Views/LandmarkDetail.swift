//
//  LandmarkDetailView.swift
//  Landmarks
//
//  Created by Lidiia Diachkovskaia on 2/14/25.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        
        
        ScrollView {
            MapView(coordinates: landmark.locationCoordinates)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .padding(.bottom, -130.0)
                .offset(y: -130)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.subheadline)
                    .foregroundStyle(.green)
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                        .foregroundStyle(.orange)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
                
            }
            .padding()
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LandmarkDetail(landmark: landmarks[0])
}
