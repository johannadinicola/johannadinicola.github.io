import Foundation
import Combine
import SwiftUI

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("postData.json")
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.categories.rawValue }
        )
    }
}

fileprivate func data(_ filename: String, subdirectory: String? = nil) -> Data {
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil, subdirectory: subdirectory)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        return try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data = data(filename)
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func loadImage(_ filename: String, subdirectory: String) -> Image {
    let data = data(filename, subdirectory: subdirectory)
    
    #if os(macOS)
    guard let nsImage = NSImage(data: data) else {
        fatalError("Image data for \(filename) is invalid")
    }
    
    return Image(nsImage: nsImage)
    #else
    guard let uiImage = UIImage(data: data, scale: 3) else {
        fatalError("Image data for \(filename) is invalid")
    }

    return Image(uiImage: uiImage)
    #endif
}
