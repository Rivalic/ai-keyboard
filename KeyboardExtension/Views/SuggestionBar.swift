import UIKit

protocol SuggestionBarDelegate: AnyObject {
    func suggestionBar(_ bar: SuggestionBar, didSelectSuggestion suggestion: String)
}

class SuggestionBar: UIView {
    
    weak var delegate: SuggestionBarDelegate?
    
    private var stackView: UIStackView!
    private var suggestionButtons: [UIButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor.systemGray6
        
        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
        
        // Create initial suggestion buttons
        updateSuggestions([])
    }
    
    func updateSuggestions(_ suggestions: [String]) {
        // Remove existing buttons
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        suggestionButtons.removeAll()
        
        // Show up to 3 suggestions
        let displaySuggestions = Array(suggestions.prefix(3))
        
        if displaySuggestions.isEmpty {
            // Show placeholder
            let label = UILabel()
            label.text = "AI Suggestions"
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 14, weight: .medium)
            label.textColor = .secondaryLabel
            stackView.addArrangedSubview(label)
        } else {
            for suggestion in displaySuggestions {
                let button = createSuggestionButton(with: suggestion)
                stackView.addArrangedSubview(button)
                suggestionButtons.append(button)
            }
        }
    }
    
    private func createSuggestionButton(with text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.backgroundColor = .white
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.addTarget(self, action: #selector(suggestionTapped(_:)), for: .touchUpInside)
        return button
    }
    
    @objc private func suggestionTapped(_ sender: UIButton) {
        guard let suggestion = sender.titleLabel?.text else { return }
        delegate?.suggestionBar(self, didSelectSuggestion: suggestion)
    }
}
