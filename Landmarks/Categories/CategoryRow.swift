//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Lidiia Diachkovskaia on 2/21/25.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        CategoryItem(landmark: landmark)
                    }
                }
            }
            .frame(height: 185)
        }
    }
    
}

#Preview {
    let landmarks = ModelData().landmarks
    CategoryRow(categoryName: landmarks[6].category.rawValue, items: Array(landmarks.prefix(6)))
}
