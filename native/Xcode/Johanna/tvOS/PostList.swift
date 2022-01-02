import SwiftUI

struct PostList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false

    var filteredPosts: [Post] {
        modelData.posts.filter { post in
            (!showFavoritesOnly || post.isFavorite)
            && post.tag != nil
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredPosts) { post in
                    NavigationLink {
                        PostDetail(post: post)
                    } label: {
                        PostRow(post: post)
                    }
                    .tag(post)
                }
            }
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Toggle(isOn: $showFavoritesOnly) {
                        Label("Favorites only", systemImage: "star.fill")
                    }
                }
            }
            .navigationTitle("Posts")
            .animation(.default, value: filteredPosts)

            Text("Select a Post")
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
