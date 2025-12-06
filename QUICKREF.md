# AI Keyboard - Quick Reference

## 🚀 Quick Start

```bash
# 1. Open project
open AIKeyboard.xcodeproj

# 2. Select your team in Xcode
# 3. Build and run on device (⌘R)
# 4. Enable keyboard in Settings
```

## 📱 Enabling the Keyboard

**Settings → General → Keyboard → Keyboards → Add New Keyboard → AI Keyboard**

Then enable **"Allow Full Access"** for AI features.

## 🎨 Main Features

| Feature | Description | Location |
|---------|-------------|----------|
| **AI Predictions** | Smart word suggestions | `AIEngine.swift` |
| **Autocomplete** | Context-aware completion | `AIEngine.swift` |
| **Grammar Check** | Real-time corrections | `AIEngine.swift` |
| **Dark Mode** | Theme switching | `ThemeManager.swift` |
| **Settings Sync** | App ↔ Extension | App Groups |

## 🔧 Key Files

### Main App
```
AIKeyboard/
├── AIKeyboardApp.swift          # App entry point
├── Views/
│   ├── ContentView.swift        # Tab navigation
│   ├── HomeView.swift           # Home screen
│   ├── FeaturesView.swift       # Features list
│   ├── SettingsView.swift       # Settings
│   └── SetupGuideView.swift     # Setup help
└── Models/
    ├── SettingsManager.swift    # Settings state
    └── ThemeManager.swift       # Theme state
```

### Keyboard Extension
```
KeyboardExtension/
├── KeyboardViewController.swift # Main controller
├── Views/
│   ├── KeyboardView.swift      # Keyboard UI
│   └── SuggestionBar.swift     # Predictions
├── AI/
│   └── AIEngine.swift          # AI logic
└── KeyboardSettingsManager.swift # Settings access
```

## ⚙️ Settings

### AI Features
- `enablePredictions` - Smart predictions on/off
- `enableAutocomplete` - Autocomplete on/off
- `enableGrammarCheck` - Grammar check on/off
- `enableTextGeneration` - Text generation on/off

### Typing
- `autoCapitalization` - Auto-caps on/off
- `autoCorrection` - Auto-correct on/off
- `keyClickSound` - Sound on/off
- `hapticFeedback` - Haptic on/off

### Appearance
- `isDarkMode` - Dark mode on/off
- `selectedAccent` - Accent color

## 🧠 AI Engine Methods

```swift
// Get predictions for context
func getPredictions(for context: String) -> [String]

// Check grammar
func checkGrammar(for text: String) -> [GrammarSuggestion]

// Generate text
func generateText(from prompt: String, maxLength: Int) -> String

// Get autocomplete
func getAutocomplete(for partial: String) -> [String]
```

## 🎯 Common Tasks

### Add New Predictions
Edit `AIEngine.swift`:
```swift
private let commonWords: [String: [String]] = [
    "hello": ["world", "there"],
    // Add more here
]
```

### Change Keyboard Layout
Edit `KeyboardView.swift`:
```swift
let rows = [
    ["q", "w", "e", ...],
    // Modify layout
]
```

### Add New Theme Color
Edit `ThemeManager.swift`:
```swift
enum AccentOption: String, CaseIterable {
    case newColor = "New Color"
    
    var color: Color {
        case .newColor: return .cyan
    }
}
```

### Add New Setting
1. Add to `SettingsManager.swift`
2. Add to `KeyboardSettingsManager.swift`
3. Add UI in `SettingsView.swift`

## 🐛 Debugging

### Keyboard Not Showing
```
1. Check Settings → Keyboards
2. Rebuild app
3. Restart device
4. Check console logs
```

### No Predictions
```
1. Enable "Allow Full Access"
2. Check AI features in settings
3. Verify text context
4. Check AIEngine logs
```

### Settings Not Syncing
```
1. Verify App Groups capability
2. Check group identifier matches
3. Reinstall app
```

## 📊 Project Structure

```
deep-station/
├── AIKeyboard/              # Main app
│   ├── AIKeyboardApp.swift
│   ├── Views/
│   ├── Models/
│   └── Info.plist
├── KeyboardExtension/       # Keyboard
│   ├── KeyboardViewController.swift
│   ├── Views/
│   ├── AI/
│   └── Info.plist
├── Shared/                  # Shared code
│   ├── Extensions.swift
│   └── Constants.swift
├── AIKeyboard.xcodeproj/    # Xcode project
├── README.md                # Overview
├── SETUP.md                 # Setup guide
├── DEVELOPMENT.md           # Dev guide
├── FEATURES.md              # Roadmap
├── CONTRIBUTING.md          # Contribution guide
├── CHANGELOG.md             # Version history
├── PRIVACY.md               # Privacy policy
├── ASSETS.md                # Asset guide
└── LICENSE                  # MIT license
```

## 🔑 Important Constants

```swift
// App Group
"group.com.aikeyboard.shared"

// Bundle IDs
"com.aikeyboard.AIKeyboard"           // Main app
"com.aikeyboard.AIKeyboard.extension" // Keyboard

// UI
keyboardHeight: 280
suggestionBarHeight: 40
maxPredictions: 3
```

## 🎨 Color Palette

```swift
Blue:    #007AFF
Purple:  #AF52DE
Pink:    #FF2D55
Green:   #34C759
Orange:  #FF9500
Red:     #FF3B30
```

## 📝 Keyboard Keys

### Special Keys
- `"shift"` - Shift/Caps
- `"delete"` - Backspace
- `"space"` - Space bar
- `"return"` - Return/Enter
- `"next"` - Switch keyboard
- `"123"` - Number keyboard
- `"ABC"` - Letter keyboard

## 🧪 Testing Checklist

- [ ] Keyboard appears in Settings
- [ ] Keys respond to taps
- [ ] Predictions update correctly
- [ ] Settings sync between app and keyboard
- [ ] Dark mode works
- [ ] Haptic feedback works
- [ ] All special keys work
- [ ] Shift toggles correctly
- [ ] Number keyboard switches

## 📚 Resources

- [Apple Keyboard Guide](https://developer.apple.com/documentation/uikit/keyboards_and_input/creating_a_custom_keyboard)
- [Natural Language](https://developer.apple.com/documentation/naturallanguage)
- [SwiftUI](https://developer.apple.com/documentation/swiftui)
- [UIKit](https://developer.apple.com/documentation/uikit)

## 🆘 Support

- **Issues**: GitHub Issues
- **Email**: support@aikeyboard.com
- **Docs**: See DEVELOPMENT.md

## 📄 License

MIT License - See LICENSE file

---

**Version**: 1.0.0  
**Last Updated**: December 6, 2025
