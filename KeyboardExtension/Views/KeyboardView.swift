import UIKit

protocol KeyboardViewDelegate: AnyObject {
    func keyboardView(_ view: KeyboardView, didTapKey key: String)
    func keyboardView(_ view: KeyboardView, didSelectSuggestion suggestion: String)
}

class KeyboardView: UIView {
    
    weak var delegate: KeyboardViewDelegate?
    
    private var suggestionBar: SuggestionBar!
    private var keyRows: [UIStackView] = []
    private var keyboardType: KeyboardType = .letters
    
    var isShifted: Bool = false
    
    enum KeyboardType {
        case letters
        case numbers
        case symbols
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor.systemGray5
        
        // Setup suggestion bar
        setupSuggestionBar()
        
        // Setup keyboard
        setupKeyboard()
    }
    
    private func setupSuggestionBar() {
        suggestionBar = SuggestionBar()
        suggestionBar.delegate = self
        suggestionBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(suggestionBar)
        
        NSLayoutConstraint.activate([
            suggestionBar.topAnchor.constraint(equalTo: topAnchor),
            suggestionBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            suggestionBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            suggestionBar.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupKeyboard() {
        let mainStack = UIStackView()
        mainStack.axis = .vertical
        mainStack.distribution = .fillEqually
        mainStack.spacing = 8
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: suggestionBar.bottomAnchor, constant: 8),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        
        // Create keyboard rows
        createLetterKeyboard(in: mainStack)
    }
    
    private func createLetterKeyboard(in stackView: UIStackView) {
        // Clear existing rows
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        keyRows.removeAll()
        
        let rows = [
            ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
            ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
            ["shift", "z", "x", "c", "v", "b", "n", "m", "delete"],
            ["123", "next", "space", "return"]
        ]
        
        for row in rows {
            let rowStack = createKeyRow(keys: row)
            stackView.addArrangedSubview(rowStack)
            keyRows.append(rowStack)
        }
    }
    
    private func createNumberKeyboard(in stackView: UIStackView) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        keyRows.removeAll()
        
        let rows = [
            ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
            ["-", "/", ":", ";", "(", ")", "$", "&", "@", "\""],
            ["#+=", ".", ",", "?", "!", "'", "delete"],
            ["ABC", "next", "space", "return"]
        ]
        
        for row in rows {
            let rowStack = createKeyRow(keys: row)
            stackView.addArrangedSubview(rowStack)
            keyRows.append(rowStack)
        }
    }
    
    private func createKeyRow(keys: [String]) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 6
        
        for key in keys {
            let button = createKeyButton(for: key)
            stack.addArrangedSubview(button)
        }
        
        return stack
    }
    
    private func createKeyButton(for key: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure appearance based on key type
        switch key {
        case "space":
            button.setTitle("space", for: .normal)
            button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 5).isActive = true
            
        case "shift", "delete", "return", "next", "123", "ABC", "#+=":
            button.setTitle(getKeyLabel(for: key), for: .normal)
            button.backgroundColor = UIColor.systemGray3
            button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1.5).isActive = true
            
        default:
            button.setTitle(key, for: .normal)
        }
        
        button.backgroundColor = button.backgroundColor ?? .white
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 1)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 0
        
        button.addTarget(self, action: #selector(keyTapped(_:)), for: .touchUpInside)
        
        return button
    }
    
    private func getKeyLabel(for key: String) -> String {
        switch key {
        case "shift": return "⇧"
        case "delete": return "⌫"
        case "return": return "return"
        case "next": return "🌐"
        default: return key
        }
    }
    
    @objc private func keyTapped(_ sender: UIButton) {
        guard let key = sender.titleLabel?.text else { return }
        
        let keyValue: String
        switch key {
        case "⇧": keyValue = "shift"
        case "⌫": keyValue = "delete"
        case "🌐": keyValue = "next"
        default: keyValue = key
        }
        
        delegate?.keyboardView(self, didTapKey: keyValue)
    }
    
    // MARK: - Public Methods
    
    func updateSuggestions(_ suggestions: [String]) {
        suggestionBar.updateSuggestions(suggestions)
    }
    
    func toggleShift() {
        isShifted.toggle()
        updateKeyLabels()
    }
    
    func setShift(_ shifted: Bool) {
        isShifted = shifted
        updateKeyLabels()
    }
    
    func switchToNumbers() {
        keyboardType = .numbers
        if let mainStack = keyRows.first?.superview as? UIStackView {
            createNumberKeyboard(in: mainStack)
        }
    }
    
    func switchToLetters() {
        keyboardType = .letters
        if let mainStack = keyRows.first?.superview as? UIStackView {
            createLetterKeyboard(in: mainStack)
        }
    }
    
    private func updateKeyLabels() {
        // Update letter case based on shift state
        for rowStack in keyRows {
            for case let button as UIButton in rowStack.arrangedSubviews {
                if let text = button.titleLabel?.text,
                   text.count == 1,
                   text.rangeOfCharacter(from: .letters) != nil {
                    button.setTitle(isShifted ? text.uppercased() : text.lowercased(), for: .normal)
                }
            }
        }
    }
}

// MARK: - SuggestionBarDelegate
extension KeyboardView: SuggestionBarDelegate {
    func suggestionBar(_ bar: SuggestionBar, didSelectSuggestion suggestion: String) {
        delegate?.keyboardView(self, didSelectSuggestion: suggestion)
    }
}
