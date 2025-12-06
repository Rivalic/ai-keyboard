import SwiftUI
import Combine

class ThemeManager: ObservableObject {
    static let shared = ThemeManager()
    
    enum AccentOption: String, CaseIterable {
        case blue = "Blue"
        case purple = "Purple"
        case pink = "Pink"
        case green = "Green"
        case orange = "Orange"
        case red = "Red"
        
        var color: Color {
            switch self {
            case .blue: return .blue
            case .purple: return .purple
            case .pink: return .pink
            case .green: return .green
            case .orange: return .orange
            case .red: return .red
            }
        }
    }
    
    @Published var isDarkMode: Bool {
        didSet { UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode") }
    }
    
    @Published var selectedAccent: AccentOption {
        didSet { 
            UserDefaults.standard.set(selectedAccent.rawValue, forKey: "selectedAccent")
        }
    }
    
    var accentColor: Color {
        selectedAccent.color
    }
    
    private init() {
        self.isDarkMode = UserDefaults.standard.object(forKey: "isDarkMode") as? Bool ?? false
        
        let accentString = UserDefaults.standard.string(forKey: "selectedAccent") ?? AccentOption.blue.rawValue
        self.selectedAccent = AccentOption(rawValue: accentString) ?? .blue
    }
}
