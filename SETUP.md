# Setup Instructions

## Quick Start

### 1. Open the Project
- Open `AIKeyboard.xcodeproj` in Xcode 14 or later

### 2. Configure Code Signing
1. Select the project in the navigator
2. Select the "AIKeyboard" target
3. Go to "Signing & Capabilities"
4. Select your development team
5. Repeat for "KeyboardExtension" target

### 3. Configure App Groups
1. In "Signing & Capabilities" for both targets
2. Click "+ Capability"
3. Add "App Groups"
4. Enable `group.com.aikeyboard.shared`
   - You may need to change this to match your team ID
   - Update the group identifier in both Info.plist files

### 4. Build and Run
1. Connect a physical iOS device (keyboard extensions require real devices)
2. Select your device as the build target
3. Click Run (⌘R)

### 5. Enable the Keyboard
1. On your device, go to **Settings**
2. Navigate to **General** → **Keyboard** → **Keyboards**
3. Tap **Add New Keyboard**
4. Select **AI Keyboard** from the list
5. Tap **AI Keyboard** in the keyboard list
6. Enable **Allow Full Access** (required for AI features)

### 6. Test the Keyboard
1. Open any app with text input (Messages, Notes, Safari)
2. Tap in a text field
3. Tap the 🌐 globe icon to switch to AI Keyboard
4. Start typing and see AI predictions!

## Troubleshooting

### Keyboard doesn't appear
- Make sure you've enabled it in Settings
- Rebuild and reinstall the app
- Restart your device

### No predictions showing
- Enable "Allow Full Access" in keyboard settings
- Check that AI features are enabled in the app settings
- Make sure you're typing in English

### Settings not syncing
- Verify App Groups are configured correctly
- Check that the group identifier matches in both targets
- Reinstall the app

## Development

See [DEVELOPMENT.md](DEVELOPMENT.md) for detailed development instructions.

## Requirements

- iOS 15.0+
- Xcode 14.0+
- Physical iOS device (keyboard extensions don't work in simulator)
- Apple Developer Account (for device testing)
