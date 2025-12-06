import Foundation

class KeyboardSettingsManager {
    static let shared = KeyboardSettingsManager()
    
    private let userDefaults: UserDefaults?
    
    // AI Features
    var enablePredictions: Bool {
        get { userDefaults?.bool(forKey: "enablePredictions") ?? true }
    }
    
    var enableAutocomplete: Bool {
        get { userDefaults?.bool(forKey: "enableAutocomplete") ?? true }
    }
    
    var enableGrammarCheck: Bool {
        get { userDefaults?.bool(forKey: "enableGrammarCheck") ?? true }
    }
    
    var enableTextGeneration: Bool {
        get { userDefaults?.bool(forKey: "enableTextGeneration") ?? true }
    }
    
    // Typing Settings
    var autoCapitalization: Bool {
        get { userDefaults?.bool(forKey: "autoCapitalization") ?? true }
    }
    
    var autoCorrection: Bool {
        get { userDefaults?.bool(forKey: "autoCorrection") ?? true }
    }
    
    var keyClickSound: Bool {
        get { userDefaults?.bool(forKey: "keyClickSound") ?? false }
    }
    
    var hapticFeedback: Bool {
        get { userDefaults?.bool(forKey: "hapticFeedback") ?? true }
    }
    
    private init() {
        // Use app group to share settings between app and extension
        userDefaults = UserDefaults(suiteName: "group.com.aikeyboard.shared")
    }
}
