import SwiftUI

@main
struct AIKeyboardApp: App {
    @StateObject private var settingsManager = SettingsManager.shared
    @StateObject private var themeManager = ThemeManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settingsManager)
                .environmentObject(themeManager)
                .preferredColorScheme(themeManager.isDarkMode ? .dark : .light)
        }
    }
}
