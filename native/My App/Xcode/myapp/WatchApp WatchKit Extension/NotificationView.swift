import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var post: Post?

    var body: some View {
        VStack {
            if post != nil {
                CircleImage(image: post!.mainImage.resizable())
                    .scaledToFit()
            }

            Text(title ?? "Unknown Post")
                .font(.headline)

            Divider()

            Text(message ?? "You are within 5 miles of one of your favorite posts.")
                .font(.caption)
        }
        .lineLimit(0)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationView()
            NotificationView(title: "Turtle Rock", // name
                             message: "You are within 5 miles of Turtle Rock.",
                             post: ModelData().posts[0])
        }
    }
}

