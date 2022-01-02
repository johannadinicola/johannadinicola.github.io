import SwiftUI

@main
struct Johanna: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
            //.redacted(reason: .placeholder)
        }
        #if os(iOS) || os(macOS)
        .commands {
            JohannaCommands()
        }
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "PostNear")
        #endif
        
        #if os(macOS)
        Settings {
            JohannaSettings()
        }
        #endif
    }
}
