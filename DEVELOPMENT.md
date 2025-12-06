# AI Keyboard - Development Guide

## Project Overview

AI Keyboard is a sophisticated iOS keyboard extension that leverages on-device machine learning to provide intelligent text predictions, autocomplete, and grammar assistance.

## Architecture

### Main App (`AIKeyboard/`)
- **Purpose**: Container app for settings and onboarding
- **Key Components**:
  - `AIKeyboardApp.swift`: App entry point
  - `Views/`: SwiftUI views for the main app
  - `Models/`: Settings and theme managers

### Keyboard Extension (`KeyboardExtension/`)
- **Purpose**: The actual custom keyboard
- **Key Components**:
  - `KeyboardViewController.swift`: Main controller
  - `Views/KeyboardView.swift`: Keyboard UI
  - `Views/SuggestionBar.swift`: Prediction display
  - `AI/AIEngine.swift`: AI prediction engine

## Key Features Implementation

### 1. AI Predictions
- Uses `NaturalLanguage` framework
- Analyzes typing context
- Provides word and phrase suggestions
- Location: `AIEngine.swift`

### 2. Smart Autocomplete
- Context-aware word completion
- Phrase prediction
- Common word database
- Location: `AIEngine.getPredictions()`

### 3. Grammar Check
- Real-time grammar analysis
- Spelling corrections
- Capitalization checks
- Location: `AIEngine.checkGrammar()`

### 4. Settings Sync
- Uses App Groups for data sharing
- Shared UserDefaults between app and extension
- Group ID: `group.com.aikeyboard.shared`

## Building the Project

### Prerequisites
- Xcode 14.0 or later
- iOS 15.0 or later
- Apple Developer Account (for device testing)

### Setup Steps

1. **Open in Xcode**
   ```bash
   open AIKeyboard.xcodeproj
   ```

2. **Configure Signing**
   - Select the project in Xcode
   - Go to "Signing & Capabilities"
   - Select your development team
   - Enable "App Groups" capability
   - Add group: `group.com.aikeyboard.shared`

3. **Build and Run**
   - Select a physical device (keyboard extensions require real devices)
   - Build and run (⌘R)

4. **Enable Keyboard**
   - Go to Settings > General > Keyboard > Keyboards
   - Tap "Add New Keyboard"
   - Select "AI Keyboard"
   - Enable "Allow Full Access" for AI features

## Code Structure

### SwiftUI Views
```
AIKeyboard/Views/
├── ContentView.swift       # Main tab view
├── HomeView.swift          # Home screen
├── FeaturesView.swift      # Features showcase
├── SettingsView.swift      # Settings screen
└── SetupGuideView.swift    # Setup instructions
```

### Keyboard Extension
```
KeyboardExtension/
├── KeyboardViewController.swift  # Main controller
├── Views/
│   ├── KeyboardView.swift       # Keyboard layout
│   └── SuggestionBar.swift      # Suggestions UI
├── AI/
│   └── AIEngine.swift           # AI logic
└── KeyboardSettingsManager.swift # Settings access
```

## Customization

### Adding New Predictions
Edit `AIEngine.swift` and add to `commonWords` or `phraseCompletions`:

```swift
private let commonWords: [String: [String]] = [
    "hello": ["world", "there", "everyone"],
    // Add more...
]
```

### Changing Keyboard Layout
Modify `KeyboardView.createLetterKeyboard()` to customize key positions:

```swift
let rows = [
    ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
    // Modify layout...
]
```

### Adding Themes
Extend `ThemeManager.AccentOption` with new colors:

```swift
enum AccentOption: String, CaseIterable {
    case blue = "Blue"
    case custom = "Custom"
    
    var color: Color {
        switch self {
        case .custom: return Color(hex: "#FF6B6B")
        // Add more...
        }
    }
}
```

## Testing

### Unit Tests
- Test AI predictions
- Test settings persistence
- Test keyboard input handling

### UI Tests
- Test keyboard layout
- Test suggestion selection
- Test settings changes

### Manual Testing
1. Type in various apps (Messages, Notes, Safari)
2. Test predictions accuracy
3. Verify settings sync
4. Check haptic feedback
5. Test dark mode

## Performance Optimization

### Tips
1. **Lazy Loading**: Load AI models only when needed
2. **Caching**: Cache frequent predictions
3. **Debouncing**: Limit prediction updates
4. **Memory**: Monitor memory usage in extension

### Profiling
Use Instruments to profile:
- Time Profiler: Check prediction speed
- Allocations: Monitor memory usage
- Energy Log: Check battery impact

## Privacy & Security

### On-Device Processing
- All AI runs locally
- No data sent to servers
- No analytics collection

### App Groups
- Used only for settings sync
- No sensitive data stored
- Sandboxed environment

## Troubleshooting

### Keyboard Not Showing
1. Check if extension is enabled in Settings
2. Verify bundle identifiers match
3. Rebuild and reinstall

### Predictions Not Working
1. Check "Allow Full Access" is enabled
2. Verify AI features are enabled in settings
3. Check console logs for errors

### Settings Not Syncing
1. Verify App Group is configured
2. Check group identifier matches
3. Ensure both targets have the capability

## Future Enhancements

### Planned Features
- [ ] Multi-language support
- [ ] Custom word dictionary
- [ ] Emoji predictions
- [ ] GIF keyboard
- [ ] Voice input
- [ ] Swipe typing
- [ ] Advanced ML models
- [ ] Cloud sync (optional)

### Advanced AI
- [ ] Transformer-based predictions
- [ ] Personalized learning
- [ ] Context from other apps
- [ ] Sentiment analysis

## Resources

- [Apple Keyboard Extension Guide](https://developer.apple.com/documentation/uikit/keyboards_and_input/creating_a_custom_keyboard)
- [Natural Language Framework](https://developer.apple.com/documentation/naturallanguage)
- [App Groups](https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_security_application-groups)

## License

MIT License - See LICENSE file for details

## Support

For issues and questions:
- GitHub Issues: [repository-url]
- Email: support@aikeyboard.com
- Documentation: [docs-url]
