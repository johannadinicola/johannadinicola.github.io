import SwiftUI

struct PostDetail: View {
    @EnvironmentObject var modelData: ModelData
    var post: Post
    
    var postIndex: Int {
        modelData.posts.firstIndex(where: { $0.id == post.id })!
    }
    
    var body: some View {
        ScrollView {
            CircleImage(image: post.mainImage)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(post.title)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.posts[postIndex].isFavorite)
                }
                
                Divider()
                
                Text("About \(post.title)")
                    .font(.title2)
                Text(post.description)
            }
            .padding()
        }
        .navigationTitle(post.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PostDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        PostDetail(post: modelData.posts[0])
            .environmentObject(modelData)
    }
}
