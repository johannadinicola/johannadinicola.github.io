import SwiftUI

struct JohannaCommands: Commands {
    @FocusedBinding(\.selectedPost) var selectedPost

    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Johanna") {
            Button("\(selectedPost?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedPost?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedPost == nil)
        }
    }
}

private struct SelectedPostKey: FocusedValueKey {
    typealias Value = Binding<Post>
}

extension FocusedValues {
    var selectedPost: Binding<Post>? {
        get { self[SelectedPostKey.self] }
        set { self[SelectedPostKey.self] = newValue }
    }
}
