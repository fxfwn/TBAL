//Lexer for TBAL

enum LexError: Error {
    case unexpectedCharacter(Character, at: Int)
}
final class Lexer {
    private let chars: [Character]
    private var pos = 0

    init(source: String) {
        self.chars = Array(source)
    }
}
