import SwiftUI

struct Post: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var body: String
    var images: [String]
    
    private var favorite: Bool?
    var isFavorite: Bool {
        set { favorite = newValue }
        get { favorite ?? false }
    }
    
    private var date: String
    var postDate: Date? {
        let components = date.split(separator: " ")
        if components.count != 3 { return nil }
        let date = "\(components[0])T\(components[1])\(components[2])"
        return ISO8601DateFormatter().date(from: date)
    }
    
    private var tags: String
    var tag: Tag? {
        tags.split(separator: " ")
            .compactMap { Tag(rawValue: String($0)) }
            .first
    }
    enum Tag: String, CaseIterable, Codable {
        case photos = "photos"
    }
    
    private var image: URL
    private var imagePath: String {
        let pathComponents = image.pathComponents.suffix(7).prefix(6)
        return pathComponents.joined(separator: "/")
    }
    var mainImage: Image {
        loadImage(images.first!, subdirectory: imagePath)
    }
    var featureImage: Image {
        loadImage(image.lastPathComponent, subdirectory: imagePath)
    }
}
