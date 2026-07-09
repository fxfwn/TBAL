//Tokenizer for TBAL

enum TokenKind: Equatable {
    case identifier(String)
    case and
    case or
    case not
    case leftParen
    case rightParen
    case eof
}
struct Tokenizer {
    let kind: TokenKind
    let position: Int
}
