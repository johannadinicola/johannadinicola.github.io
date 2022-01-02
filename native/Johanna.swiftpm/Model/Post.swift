import SwiftUI

struct Post: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var body: String
    var date: String
    var images: [String]
    
    var isFavorite: Bool
    
    private var tags: String
    var tag: Tag? {
        tags
            .split(separator: " ")
            .compactMap { Tag(rawValue: String($0)) }
            .first
    }
    enum Tag: String, CaseIterable, Codable {
        case photos = "photos"
    }
    
    private var imagePath: String
    private var image: String
    var mainImage: Image {
        loadImage(images.first!, subdirectory: imagePath)
    }
    var featureImage: Image {
        loadImage(image, subdirectory: imagePath)
    }
}
