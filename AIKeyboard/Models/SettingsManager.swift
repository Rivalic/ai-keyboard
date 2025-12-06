import SwiftUI
import Combine

class SettingsManager: ObservableObject {
    static let shared = SettingsManager()
    
    // AI Features
    @Published var enablePredictions: Bool {
        didSet { UserDefaults.standard.set(enablePredictions, forKey: "enablePredictions") }
    }
    
    @Published var enableAutocomplete: Bool {
        didSet { UserDefaults.standard.set(enableAutocomplete, forKey: "enableAutocomplete") }
    }
    
    @Published var enableGrammarCheck: Bool {
        didSet { UserDefaults.standard.set(enableGrammarCheck, forKey: "enableGrammarCheck") }
    }
    
    @Published var enableTextGeneration: Bool {
        didSet { UserDefaults.standard.set(enableTextGeneration, forKey: "enableTextGeneration") }
    }
    
    // Typing Settings
    @Published var autoCapitalization: Bool {
        didSet { UserDefaults.standard.set(autoCapitalization, forKey: "autoCapitalization") }
    }
    
    @Published var autoCorrection: Bool {
        didSet { UserDefaults.standard.set(autoCorrection, forKey: "autoCorrection") }
    }
    
    @Published var keyClickSound: Bool {
        didSet { UserDefaults.standard.set(keyClickSound, forKey: "keyClickSound") }
    }
    
    @Published var hapticFeedback: Bool {
        didSet { UserDefaults.standard.set(hapticFeedback, forKey: "hapticFeedback") }
    }
    
    private init() {
        // AI Features - default enabled
        self.enablePredictions = UserDefaults.standard.object(forKey: "enablePredictions") as? Bool ?? true
        self.enableAutocomplete = UserDefaults.standard.object(forKey: "enableAutocomplete") as? Bool ?? true
        self.enableGrammarCheck = UserDefaults.standard.object(forKey: "enableGrammarCheck") as? Bool ?? true
        self.enableTextGeneration = UserDefaults.standard.object(forKey: "enableTextGeneration") as? Bool ?? true
        
        // Typing Settings - default enabled
        self.autoCapitalization = UserDefaults.standard.object(forKey: "autoCapitalization") as? Bool ?? true
        self.autoCorrection = UserDefaults.standard.object(forKey: "autoCorrection") as? Bool ?? true
        self.keyClickSound = UserDefaults.standard.object(forKey: "keyClickSound") as? Bool ?? false
        self.hapticFeedback = UserDefaults.standard.object(forKey: "hapticFeedback") as? Bool ?? true
    }
}
