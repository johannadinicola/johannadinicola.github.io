import SwiftUI

struct PostRow: View {
    var post: Post

    var body: some View {
        HStack {
            post.mainImage
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(post.title)
                    .bold()
            }
            
            Spacer()
            
            if post.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

struct PostRow_Previews: PreviewProvider {
    static var posts = ModelData().posts
    
    static var previews: some View {
        Group {
            PostRow(post: posts[0])
            PostRow(post: posts[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
