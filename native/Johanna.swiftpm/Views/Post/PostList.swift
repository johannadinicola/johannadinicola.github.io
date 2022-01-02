import SwiftUI

struct PostList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var selectedPost: Post?

    var filteredPosts: [Post] {
        modelData.posts.filter { post in
            !showFavoritesOnly || post.isFavorite
        }
    }

    var title: String {
        let title = "Posts"
        return showFavoritesOnly ? "Favorite \(title)" : title
    }

    var index: Int? {
        modelData.posts.firstIndex(where: { $0.id == selectedPost?.id })
    }

    var body: some View {
        NavigationView {
            List(selection: $selectedPost) {
                ForEach(filteredPosts) { post in
                    NavigationLink {
                        PostDetail(post: post)
                    } label: {
                        PostRow(post: post)
                    }
                    .tag(post)
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            .animation(.default, value: filteredPosts)

            Text("Select a Post")
        }
        .focusedValue(\.selectedPost, $modelData.posts[index ?? 0])
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
