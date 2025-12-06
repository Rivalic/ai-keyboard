import Foundation

/// Constants used throughout the app
enum Constants {
    
    // MARK: - App Group
    static let appGroupIdentifier = "group.com.aikeyboard.shared"
    
    // MARK: - UserDefaults Keys
    enum UserDefaultsKeys {
        // AI Features
        static let enablePredictions = "enablePredictions"
        static let enableAutocomplete = "enableAutocomplete"
        static let enableGrammarCheck = "enableGrammarCheck"
        static let enableTextGeneration = "enableTextGeneration"
        
        // Typing Settings
        static let autoCapitalization = "autoCapitalization"
        static let autoCorrection = "autoCorrection"
        static let keyClickSound = "keyClickSound"
        static let hapticFeedback = "hapticFeedback"
        
        // Appearance
        static let isDarkMode = "isDarkMode"
        static let selectedAccent = "selectedAccent"
    }
    
    // MARK: - UI Constants
    enum UI {
        static let keyboardHeight: CGFloat = 280
        static let suggestionBarHeight: CGFloat = 40
        static let keySpacing: CGFloat = 6
        static let keyCornerRadius: CGFloat = 5
        static let cardCornerRadius: CGFloat = 12
    }
    
    // MARK: - AI Constants
    enum AI {
        static let maxPredictions = 3
        static let maxGeneratedWords = 50
        static let minContextLength = 1
    }
    
    // MARK: - Animation
    enum Animation {
        static let defaultDuration: Double = 0.3
        static let springResponse: Double = 0.5
        static let springDamping: Double = 0.7
    }
}
