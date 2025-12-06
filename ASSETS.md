# Assets Guide

## App Icons

The app requires icons in the following sizes:

### iPhone
- 60x60 @2x (120x120)
- 60x60 @3x (180x180)

### iPad
- 76x76 @2x (152x152)
- 83.5x83.5 @2x (167x167)

### App Store
- 1024x1024 (no transparency)

## Design Guidelines

### Icon Design
- Use the keyboard symbol as the main element
- Apply a gradient from purple to blue
- Add subtle shadow for depth
- Keep it simple and recognizable

### Color Palette

#### Primary Colors
- **Accent Blue**: `#007AFF`
- **Accent Purple**: `#AF52DE`
- **Accent Pink**: `#FF2D55`
- **Accent Green**: `#34C759`
- **Accent Orange**: `#FF9500`
- **Accent Red**: `#FF3B30`

#### Neutral Colors
- **Background Light**: `#FFFFFF`
- **Background Dark**: `#000000`
- **Secondary Background Light**: `#F2F2F7`
- **Secondary Background Dark**: `#1C1C1E`

### Typography
- **Primary Font**: SF Pro (System)
- **Headings**: Bold, Rounded
- **Body**: Regular
- **Captions**: Medium

## Creating Assets

### Using SF Symbols
The app primarily uses SF Symbols for icons:
- `keyboard.fill` - Main app icon
- `brain.head.profile` - AI predictions
- `text.cursor` - Autocomplete
- `checkmark.seal.fill` - Grammar
- `lock.shield.fill` - Privacy
- `sparkles` - Features
- `gear` - Settings

### Custom Images
If you need custom images:
1. Export at @1x, @2x, and @3x resolutions
2. Use PNG format with transparency
3. Name files: `image@2x.png`, `image@3x.png`
4. Add to Assets.xcassets

## Asset Catalog Structure

```
Assets.xcassets/
├── AppIcon.appiconset/
│   ├── Contents.json
│   └── [icon files]
├── Colors/
│   ├── AccentColor.colorset/
│   └── [other colors]
└── Images/
    └── [custom images]
```

## Generating Icons

You can use online tools or design software:
- **Figma**: Design and export
- **Sketch**: Design and export
- **Icon Generator**: Online tools like appicon.co

### Quick Icon Generation
1. Create a 1024x1024 design
2. Use an icon generator to create all sizes
3. Import into Assets.xcassets

## Launch Screen

The app uses a SwiftUI launch screen with:
- App icon
- App name
- Gradient background

No static launch screen images needed.
