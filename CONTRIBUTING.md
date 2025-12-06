# Contributing to AI Keyboard

Thank you for your interest in contributing to AI Keyboard! This document provides guidelines for contributing to the project.

## Code of Conduct

### Our Pledge
We are committed to providing a welcoming and inclusive environment for all contributors.

### Our Standards
- Be respectful and considerate
- Welcome newcomers and help them learn
- Focus on constructive feedback
- Accept criticism gracefully

## How to Contribute

### Reporting Bugs

Before submitting a bug report:
1. Check if the bug has already been reported
2. Ensure you're using the latest version
3. Collect relevant information (iOS version, device model, steps to reproduce)

**Bug Report Template:**
```markdown
**Description**
A clear description of the bug

**Steps to Reproduce**
1. Step one
2. Step two
3. ...

**Expected Behavior**
What should happen

**Actual Behavior**
What actually happens

**Environment**
- iOS Version: 
- Device: 
- App Version: 

**Screenshots**
If applicable
```

### Suggesting Features

We welcome feature suggestions! Please:
1. Check if the feature has already been suggested
2. Explain the use case and benefits
3. Consider implementation complexity

**Feature Request Template:**
```markdown
**Feature Description**
Clear description of the feature

**Use Case**
Why is this feature needed?

**Proposed Solution**
How might this work?

**Alternatives**
Other approaches considered
```

### Pull Requests

#### Before Submitting
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test thoroughly
5. Commit with clear messages
6. Push to your fork
7. Open a pull request

#### PR Guidelines
- Follow the existing code style
- Add tests for new features
- Update documentation
- Keep PRs focused and atomic
- Write clear commit messages

**PR Template:**
```markdown
**Description**
What does this PR do?

**Related Issue**
Fixes #(issue number)

**Changes Made**
- Change 1
- Change 2

**Testing**
How was this tested?

**Screenshots**
If applicable
```

## Development Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/ai-keyboard.git
   cd ai-keyboard
   ```

2. **Open in Xcode**
   ```bash
   open AIKeyboard.xcodeproj
   ```

3. **Configure signing**
   - Select your development team
   - Update bundle identifiers if needed

4. **Build and test**
   - Build the project (⌘B)
   - Run tests (⌘U)
   - Test on device

## Code Style

### Swift Style Guide
We follow the [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)

**Key Points:**
- Use meaningful names
- Prefer clarity over brevity
- Use camelCase for variables and functions
- Use PascalCase for types
- Add comments for complex logic
- Use `// MARK:` for organization

**Example:**
```swift
// MARK: - Properties

private var keyboardView: KeyboardView!
private let aiEngine: AIEngine

// MARK: - Lifecycle

override func viewDidLoad() {
    super.viewDidLoad()
    setupKeyboardView()
}

// MARK: - Private Methods

private func setupKeyboardView() {
    // Implementation
}
```

### SwiftUI Style
- Use descriptive view names
- Extract complex views into separate files
- Use `@State`, `@Binding`, `@ObservedObject` appropriately
- Prefer composition over inheritance

### Comments
- Use `///` for documentation comments
- Explain "why" not "what"
- Keep comments up to date

## Testing

### Unit Tests
- Test business logic
- Test AI predictions
- Test settings management

### UI Tests
- Test keyboard layout
- Test user interactions
- Test navigation

### Manual Testing
- Test on multiple devices
- Test in different apps
- Test edge cases

## Documentation

When adding features:
1. Update README.md if needed
2. Update FEATURES.md
3. Add inline code documentation
4. Update setup guides if needed

## Commit Messages

Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
type(scope): subject

body

footer
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Formatting
- `refactor`: Code restructuring
- `test`: Adding tests
- `chore`: Maintenance

**Examples:**
```
feat(keyboard): add swipe typing support

Implemented gesture recognizer for swipe typing.
Added path tracking and word prediction.

Closes #123
```

```
fix(ai): improve prediction accuracy

Fixed issue where predictions were not updating
correctly after punctuation.

Fixes #456
```

## Review Process

1. **Automated Checks**
   - Code builds successfully
   - Tests pass
   - No linting errors

2. **Code Review**
   - At least one maintainer approval
   - All comments addressed
   - Documentation updated

3. **Merge**
   - Squash and merge for feature PRs
   - Merge commit for releases

## Release Process

1. Update version numbers
2. Update CHANGELOG.md
3. Create release branch
4. Test thoroughly
5. Tag release
6. Submit to App Store

## Questions?

- Open an issue for questions
- Join our discussions
- Email: dev@aikeyboard.com

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to AI Keyboard! 🎉
