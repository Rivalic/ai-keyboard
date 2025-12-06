import UIKit

class KeyboardViewController: UIInputViewController {
    
    private var keyboardView: KeyboardView!
    private var aiEngine: AIEngine!
    private var settingsManager: KeyboardSettingsManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize managers
        settingsManager = KeyboardSettingsManager.shared
        aiEngine = AIEngine()
        
        // Setup keyboard view
        setupKeyboardView()
        
        // Setup text document proxy observer
        setupTextObserver()
    }
    
    private func setupKeyboardView() {
        keyboardView = KeyboardView(frame: .zero)
        keyboardView.delegate = self
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(keyboardView)
        
        NSLayoutConstraint.activate([
            keyboardView.topAnchor.constraint(equalTo: view.topAnchor),
            keyboardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            keyboardView.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    private func setupTextObserver() {
        // Observe text changes for AI predictions
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textDidChange),
            name: UITextInputMode.currentInputModeDidChangeNotification,
            object: nil
        )
    }
    
    @objc private func textDidChange() {
        updatePredictions()
    }
    
    private func updatePredictions() {
        guard settingsManager.enablePredictions else { return }
        
        let context = getCurrentContext()
        let predictions = aiEngine.getPredictions(for: context)
        keyboardView.updateSuggestions(predictions)
    }
    
    private func getCurrentContext() -> String {
        guard let proxy = textDocumentProxy else { return "" }
        
        var context = ""
        
        // Get text before cursor
        if let beforeText = proxy.documentContextBeforeInput {
            context = beforeText
        }
        
        return context
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // Called when text is about to change
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // Update predictions when text changes
        updatePredictions()
    }
}

// MARK: - KeyboardViewDelegate
extension KeyboardViewController: KeyboardViewDelegate {
    func keyboardView(_ view: KeyboardView, didTapKey key: String) {
        let proxy = textDocumentProxy
        
        switch key {
        case "delete":
            proxy.deleteBackward()
            
        case "space":
            proxy.insertText(" ")
            
        case "return":
            proxy.insertText("\n")
            
        case "shift":
            // Toggle shift state
            keyboardView.toggleShift()
            
        case "123":
            // Switch to number keyboard
            keyboardView.switchToNumbers()
            
        case "ABC":
            // Switch to letter keyboard
            keyboardView.switchToLetters()
            
        case "next":
            // Switch to next keyboard
            advanceToNextInputMode()
            
        default:
            // Insert the character
            let text = keyboardView.isShifted ? key.uppercased() : key.lowercased()
            proxy.insertText(text)
            
            // Auto-shift after sentence end
            if settingsManager.autoCapitalization && (key == "." || key == "!" || key == "?") {
                keyboardView.setShift(true)
            } else if keyboardView.isShifted {
                keyboardView.setShift(false)
            }
        }
        
        // Haptic feedback
        if settingsManager.hapticFeedback {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        
        // Update predictions
        updatePredictions()
    }
    
    func keyboardView(_ view: KeyboardView, didSelectSuggestion suggestion: String) {
        let proxy = textDocumentProxy
        
        // Delete the current word
        if let beforeText = proxy.documentContextBeforeInput {
            let words = beforeText.components(separatedBy: .whitespacesAndNewlines)
            if let lastWord = words.last, !lastWord.isEmpty {
                for _ in 0..<lastWord.count {
                    proxy.deleteBackward()
                }
            }
        }
        
        // Insert the suggestion
        proxy.insertText(suggestion)
        
        // Add space after suggestion
        proxy.insertText(" ")
        
        // Update predictions
        updatePredictions()
    }
}
