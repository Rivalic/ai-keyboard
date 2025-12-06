import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settingsManager: SettingsManager
    @EnvironmentObject var themeManager: ThemeManager
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            FeaturesView()
                .tabItem {
                    Label("Features", systemImage: "sparkles")
                }
                .tag(1)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(2)
        }
        .accentColor(themeManager.accentColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SettingsManager.shared)
            .environmentObject(ThemeManager.shared)
    }
}
