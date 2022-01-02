import SwiftUI

struct CircleImage: View {
    var image: Image
    
    fileprivate var circleImageView: some View {
        image
            .clipShape(Circle())
            .shadow(radius: 7)
    }
    
    var body: some View {
        if #available(iOS 15.0, watchOSApplicationExtension 8.0, macOS 12.0, tvOS 15.0, *) {
            circleImageView
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
        } else {
            circleImageView
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("thanksgiving-visits"))
    }
}
