import SwiftUI

struct PostList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredPosts: [Post] {
        modelData.posts.filter { post in
            (!showFavoritesOnly || post.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredPosts) { post in
                    NavigationLink {
                        PostDetail(post: post)
                    } label: {
                        PostRow(post: post)
                    }
                }
            }
            .navigationTitle("Posts")
            .animation(.default, value: showFavoritesOnly)
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            PostList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
