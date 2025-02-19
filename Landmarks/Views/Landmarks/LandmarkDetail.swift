//
//  LandmarkDetailView.swift
//  Landmarks
//
//  Created by Lidiia Diachkovskaia on 2/14/25.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @Environment(ModelData.self) var modelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
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
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
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
    let modelData = ModelData()
    LandmarkDetail(landmark: ModelData().landmarks[3])
        .environment(modelData)
}
