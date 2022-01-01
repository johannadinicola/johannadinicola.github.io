import SwiftUI

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var body: String
    var date: String
    var images: [String]
    
    var isFavorite: Bool
    var isFeatured: Bool
    
    var categories: Category
    enum Category: String, CaseIterable, Codable {
        case posts = "posts"
    }
    
    private var imagePath: String
    private var image: String
    var mainImage: Image {
        loadImage(images.first!, subdirectory: imagePath)
    }
    var featureImage: Image? {
        isFeatured ? loadImage(image, subdirectory: imagePath) : nil
    }
}
