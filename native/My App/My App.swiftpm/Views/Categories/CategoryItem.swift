import SwiftUI

struct CategoryItem: View {
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            post.mainImage
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(post.title)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(post: ModelData().posts[0])
    }
}
