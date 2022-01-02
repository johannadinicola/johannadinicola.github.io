import SwiftUI
import MapKit

struct PostDetail: View {
    @EnvironmentObject var modelData: ModelData
    var post: Post

    var postIndex: Int {
        modelData.posts.firstIndex(where: { $0.id == post.id })!
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleImage(image: post.mainImage.resizable())
                        .frame(width: 160, height: 160)

                    VStack(alignment: .leading) {
                        HStack {
                            Text(post.title)
                                .font(.title)
                            FavoriteButton(isSet: $modelData.posts[postIndex].isFavorite)
                        }
                    }
                }

                Divider()

                Text("About \(post.title)")
                    .font(.title2)
                    .focusable()
                Text(post.description)
                    .focusable()
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(post.title)
    }
}

struct PostDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        PostDetail(post: modelData.posts[0])
            .environmentObject(modelData)
            .frame(width: 850, height: 700)
    }
}

