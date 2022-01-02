import SwiftUI

struct PostDetail: View {
    @EnvironmentObject var modelData: ModelData
    var post: Post

    var postIndex: Int {
        modelData.posts.firstIndex(where: { $0.id == post.id })!
    }

    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: post.mainImage.resizable())
                    .scaledToFit()

                Text(post.title)
                    .font(.headline)
                    .lineLimit(0)

                Toggle(isOn: $modelData.posts[postIndex].isFavorite) {
                    Text("Favorite")
                }
            }
            .padding(16)
        }
        .navigationTitle("Posts")
    }
}

struct PostDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        return Group {
            PostDetail(post: modelData.posts[0])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 44mm")

            PostDetail(post: modelData.posts[1])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
