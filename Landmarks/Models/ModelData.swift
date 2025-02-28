//
//  ModeData.swift
//  Landmarks
//
//  Created by Lidiia Diachkovskaia on 2/14/25.
//

import Foundation

@Observable
class ModelData {
    
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    var profile = Profile.draft
    
    var featured: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarks, by:
                    {$0.category.rawValue}
        )
    }
    
}


var number: Int = 1

func load<T: Decodable>(_ filename: String) -> T {

    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }

}
