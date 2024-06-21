import SwiftUI
import MyDesignSystem

@main
struct SwiftuitestApp: App {
    init() {
        Wanted.register()
    }
    
    var body: some Scene {
        WindowGroup {
            VStack {
                GrowAvatar(type: .extraLarge)
                Text("Hello World")
                    .growColor(.textNormal)
                Text("Hello World")
                    .growColor(.textNormal)
                    .growFont(.bodyM)
            }
            .environmentObject(ColorProvider(isDarkTheme: false))
        }
    }
}
