//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Lidiia Diachkovskaia on 2/21/25.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            List{
                modelData.featured[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 220)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) {
                    key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
                .navigationTitle("Featured")
                .toolbar{
                    Button{
                        showingProfile.toggle()
                    } label: {
                                Label("User Profile", systemImage: "person.crop.circle")
                            }
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environment(modelData)
                }
            
        } detail: {
            Text("Select a Landmark")
        }
    
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
