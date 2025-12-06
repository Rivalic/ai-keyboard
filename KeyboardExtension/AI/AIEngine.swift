import Foundation
import NaturalLanguage

class AIEngine {
    
    private let languageRecognizer = NLLanguageRecognizer()
    private let tokenizer = NLTokenizer(unit: .word)
    private let tagger = NLTagger(tagSchemes: [.lexicalClass, .lemma])
    
    // Common word predictions database
    private let commonWords: [String: [String]] = [
        "the": ["quick", "best", "first", "last", "only"],
        "i": ["am", "was", "will", "have", "can"],
        "you": ["are", "were", "will", "have", "can"],
        "is": ["a", "the", "not", "very", "really"],
        "are": ["you", "we", "they", "the", "not"],
        "have": ["a", "been", "to", "the", "not"],
        "it": ["is", "was", "will", "has", "can"],
        "to": ["be", "the", "a", "do", "make"],
        "in": ["the", "a", "this", "my", "your"],
        "for": ["the", "a", "you", "me", "this"],
        "on": ["the", "a", "this", "my", "your"],
        "with": ["the", "a", "you", "me", "this"],
        "at": ["the", "a", "this", "least", "most"],
        "by": ["the", "a", "me", "you", "this"],
        "from": ["the", "a", "this", "here", "there"]
    ]
    
    // Phrase completions
    private let phraseCompletions: [String: [String]] = [
        "how are": ["you", "you doing", "things"],
        "thank": ["you", "you so much", "you very much"],
        "i am": ["fine", "good", "okay", "sorry", "happy"],
        "i will": ["be", "do", "go", "come", "try"],
        "i have": ["been", "to", "a", "no", "some"],
        "what is": ["this", "that", "your", "the", "it"],
        "where is": ["the", "my", "your", "it", "this"],
        "when is": ["the", "it", "this", "that", "your"],
        "can you": ["help", "please", "tell", "show", "give"],
        "would you": ["like", "please", "mind", "be", "prefer"]
    ]
    
    init() {
        // Initialize AI models
        setupModels()
    }
    
    private func setupModels() {
        // Configure language recognizer
        languageRecognizer.processString("")
    }
    
    // MARK: - Prediction Methods
    
    func getPredictions(for context: String) -> [String] {
        guard !context.isEmpty else {
            return getDefaultSuggestions()
        }
        
        var predictions: [String] = []
        
        // Get the last few words for context
        let words = context.lowercased()
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
        
        guard let lastWord = words.last else {
            return getDefaultSuggestions()
        }
        
        // Check for phrase completions
        if words.count >= 2 {
            let lastTwoWords = words.suffix(2).joined(separator: " ")
            if let completions = phraseCompletions[lastTwoWords] {
                predictions.append(contentsOf: completions)
            }
        }
        
        // Check for word-based predictions
        if let wordPredictions = commonWords[lastWord] {
            predictions.append(contentsOf: wordPredictions)
        }
        
        // Add contextual predictions
        predictions.append(contentsOf: getContextualPredictions(for: lastWord, context: context))
        
        // Remove duplicates and limit to 3
        let uniquePredictions = Array(Set(predictions)).prefix(3)
        
        return Array(uniquePredictions)
    }
    
    private func getContextualPredictions(for word: String, context: String) -> [String] {
        var predictions: [String] = []
        
        // Detect language
        languageRecognizer.processString(context)
        let language = languageRecognizer.dominantLanguage
        
        // Use NLP to get predictions
        tokenizer.string = context
        let tokens = tokenizer.tokens(for: context.startIndex..<context.endIndex)
        
        // Analyze context
        tagger.string = context
        let tags = tagger.tags(in: context.startIndex..<context.endIndex, 
                              unit: .word, 
                              scheme: .lexicalClass)
        
        // Generate predictions based on part of speech
        for (tag, _) in tags {
            if let lexicalClass = tag {
                switch lexicalClass {
                case .verb:
                    predictions.append(contentsOf: ["the", "a", "to", "and"])
                case .noun:
                    predictions.append(contentsOf: ["is", "was", "and", "or"])
                case .adjective:
                    predictions.append(contentsOf: ["and", "or", "but"])
                default:
                    break
                }
            }
        }
        
        return predictions
    }
    
    private func getDefaultSuggestions() -> [String] {
        return ["the", "a", "to"]
    }
    
    // MARK: - Grammar Check
    
    func checkGrammar(for text: String) -> [GrammarSuggestion] {
        var suggestions: [GrammarSuggestion] = []
        
        // Check for common grammar issues
        
        // Double spaces
        if text.contains("  ") {
            suggestions.append(GrammarSuggestion(
                type: .spacing,
                range: text.range(of: "  ")!,
                message: "Extra space detected",
                suggestion: " "
            ))
        }
        
        // Capitalization after period
        let sentences = text.components(separatedBy: ". ")
        for (index, sentence) in sentences.enumerated() {
            if index > 0 && !sentence.isEmpty {
                let firstChar = sentence.first!
                if firstChar.isLowercase {
                    suggestions.append(GrammarSuggestion(
                        type: .capitalization,
                        range: sentence.startIndex..<sentence.index(after: sentence.startIndex),
                        message: "Should be capitalized",
                        suggestion: String(firstChar.uppercased())
                    ))
                }
            }
        }
        
        return suggestions
    }
    
    // MARK: - Text Generation
    
    func generateText(from prompt: String, maxLength: Int = 50) -> String {
        // Simple text generation based on common patterns
        let words = prompt.lowercased()
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
        
        guard let lastWord = words.last else {
            return ""
        }
        
        var generated = ""
        var currentWord = lastWord
        var wordCount = 0
        
        while wordCount < maxLength {
            if let nextWords = commonWords[currentWord], let nextWord = nextWords.randomElement() {
                generated += nextWord + " "
                currentWord = nextWord
                wordCount += 1
            } else {
                break
            }
        }
        
        return generated.trimmingCharacters(in: .whitespaces)
    }
    
    // MARK: - Autocomplete
    
    func getAutocomplete(for partial: String) -> [String] {
        guard !partial.isEmpty else { return [] }
        
        let lowercased = partial.lowercased()
        
        // Find words that start with the partial text
        let matches = commonWords.keys.filter { $0.hasPrefix(lowercased) }
        
        return Array(matches.prefix(3))
    }
}

// MARK: - Supporting Types

struct GrammarSuggestion {
    enum SuggestionType {
        case spelling
        case grammar
        case capitalization
        case spacing
        case punctuation
    }
    
    let type: SuggestionType
    let range: Range<String.Index>
    let message: String
    let suggestion: String
}
