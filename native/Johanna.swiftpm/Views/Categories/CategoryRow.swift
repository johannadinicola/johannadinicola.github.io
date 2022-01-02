import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Post]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { post in
                        NavigationLink {
                            PostDetail(post: post)
                        } label: {
                            CategoryItem(post: post)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var posts = ModelData().posts
    
    static var previews: some View {
        CategoryRow(
            categoryName: posts[0].tag?.rawValue ?? "",
            items: Array(posts.prefix(4))
            )
    }
}
