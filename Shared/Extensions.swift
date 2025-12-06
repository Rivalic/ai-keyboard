import Foundation

extension UserDefaults {
    /// Shared UserDefaults for app group
    static var shared: UserDefaults {
        return UserDefaults(suiteName: "group.com.aikeyboard.shared") ?? .standard
    }
}

extension String {
    /// Returns the last word in the string
    var lastWord: String? {
        let words = self.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
        return words.last
    }
    
    /// Returns the last N words in the string
    func lastWords(_ count: Int) -> [String] {
        let words = self.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
        return Array(words.suffix(count))
    }
    
    /// Checks if the string ends with sentence-ending punctuation
    var endsWithSentence: Bool {
        guard let last = self.last else { return false }
        return [".", "!", "?"].contains(String(last))
    }
}

extension Array where Element == String {
    /// Removes duplicate strings while preserving order
    var unique: [String] {
        var seen = Set<String>()
        return filter { seen.insert($0).inserted }
    }
}
