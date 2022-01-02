import SwiftUI

struct FeatureCard: View {
    var post: Post
    
    fileprivate var featureCardView: some View {
        post.featureImage
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
    }
    
    var body: some View {
        if #available(iOS 15.0, *) {
            featureCardView
                .overlay {
                    TextOverlay(post: post)
                }
        } else {
            featureCardView
        }
    }
}

struct TextOverlay: View {
    var post: Post
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.title)
                    .bold()
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(post: ModelData().features[0])
    }
}
