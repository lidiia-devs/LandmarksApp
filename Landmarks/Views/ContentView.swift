//
//  ContentView.swift
//  Landmarks
//
//  Created by Lidiia Diachkovskaia on 2/13/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        LandmarkList()
    
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
