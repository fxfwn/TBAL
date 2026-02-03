# A Tour of the TBAL microlanguage

## What is `TBAL` and what is it for?
`TBAL` (Tiny Boolean Algebra Language) is an open source microlanguage implemented in Swift as a cross platform microlanguage to evaluate boolean expressions and generate of truth tables easily and intuitively. TBAL originated from an older, but similar project implemented in Python (and initially planned, but not implemented in Lisp) called "LTTG".

## Syntax and Usage
TBAL programs consist of one or more boolean expressions. Each expression is evaluated independently and produces a full truth table covering all possible binary inputs.

### Boolean values
TBAL operates on binary boolean values only.
- `0` represents `false`
- `1` represents `true`

(when writing expressions, boolean literals may be added later; currently, all inputs are variables.)

### Variables
Variables represent boolean inputs.
- Variable names may exclusively be lowercase
- Variables must begin with a letter
- Variables may contain letters and digits
Examples:
```
a
input1
```
The set of variables used in an expression is determined automatically.

By default, TBAL limits expressions to 16 distinct variables.

### Operators
TBAL supports the following boolean operators.
All operators are **uppercase** and reserved.
- `NOT` - logical negation (unary)
- `AND` - logical conjunction
- `OR` - logical disjunction

Operator precedence (from highest to lowest):
1. `NOT`
2. `AND`
3. `OR`

Parentheses may be used to explicitly control evaluation order.

Compound operators like `NAND`, `XOR`, `NOR` and `XNOR` are not yet supported, but may be added in a later version.

Examples:
```
NOTa AND b    #equivalent to (NOT a) AND b
a AND (b OR c)
```

Currently unsupported operators are rewritten as follows:
- `a XOR b` -> `(a AND NOT b) OR (NOT a AND b)`
- `a NAND b` -> `NOT (a AND b)`
- `a NOR b` -> `NOT (a OR b)`
- `a XNOR b` -> `(a AND b) OR (NOT a AND NOT b)`

### Expressions
An expression is a combination of variables, operators and parentheses.

Examples:
```
a AND b
a OR NOT b
(a AND b) OR (NOT c)
```
Whitespace is insignificant except as a separator between tokens. (Mainly for readability, the interpreter just ignore whitespaces.)

### Input modes
TBAL can evaluate expressions provided in several ways.

**Expression from the command line (REPL-mode)
```
tbal "a AND b"
```

**Expression form a file
```
tbal example.tbal
```

### `.tbal` files
A `.tbal` file contains one boolean expression per line.
- Blank lines are ignored
- Lines beginning with `#` are treated as comments
- Each non-empty expression produces its own truth table

Example `example.tbal`:
```
# Simple boolean expressions
a AND b
a OR b
NOT a AND C
```

## Output
For each expression, TBAL outputs a truth table listing all possible input combinations and the resulting output.
- Rows are generated for every possible assignment of variables
- Output is written to standard output
- Truth tables are streamed row-by-row

Example output:
```
a | b | OUT
0 | 0 | 0
0 | 1 | 0
1 | 0 | 0
1 | 1 | 1
```