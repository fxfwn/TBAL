//Parser for TBAL
public indirect enum Expr
{
    case literal(Bool)
    case variable(String)
    case NOT(Expr)
    case AND(Expr, Expr)
    case OR(Expr, Expr)
}

public func parse(tokens: [Token]) throws -> Expr {...}