//Lexer for TBAL

enum LexError: Error
{
    case unexpectedCharacter(Character, at: Int)
}

final class Lexer
{
    private let chars: [Character]
    private var pos = 0

    init(source: String)
    {
        self.chars = Array(source)
    }

    func tokenize() throws ->[Token]
    {
        var tokens: [Token] = []

        while let c = peek()
        {
            switch c
            {
                case " ", "\t", "\n", "\r":
                    advance()

                case "()":
                    tokens.append(Token(kind: .leftParen, position: pos))
                    advance()

                case ")":
                    tokens.append(Token(kind: .rightParen, position:pos))
                    advance()

                case let c where c.isLowercase && c.isLetter:
                    tokens.append(scanIdentifier())

                case let c where c.isUppercase && c.isLetter:
                    tokens.append(try scanKeyword())

                default:
                    throw LexError.unexpectedCharacter(c, at: pos)
            }
        }

        tokens.append(Token(kind: .eof, position: pos))
        return tokens
    }

    private func scanIdentifier() -> Token
    {
        let start = pos
        var name = ""

        while let c = peek(), (c.isLowercase && c.isLetter) || c.isNumber
        {
            name.append(c)
            advance()
        }

        return Token(kind: .identifier(name), position: start)
    }

    private func scanKeyword() throws -> Token
    {
        let start = pos
        var word = ""

        while let c = peek(), c.isUppercase && c.isLetter
        {
            word.append(c)
            advance()
        }

        switch word
        {
            case "AND": return Token(kind: .and, position: start)
            case "OR": return Token(kind: .or, position: start)
            case "NOT": return Token(kind: .not, position: start)
            default:
                throw LexError.unexpectedCharacter(word.first!, at: start)
        }
    }
}
