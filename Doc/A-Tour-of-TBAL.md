# A Tour of the TBAL microlanguage

## What is `TBAL` and what is it for?
`TBAL` (Tiny Boolean Algebra Language) is an open source microlanguage implemented in Swift as a cross platform microlanguage to evaluate boolean expressions and generate of truth tables easily and intuitively. TBAL originated from an older, but similar project implemented in Python called "LTTG".

## Syntax
TBAL is an interpreted microlanguage. As such, it has very minimal syntax, containing only three keywords, all of which are logic operators: `AND`, `OR` and `NOT`.

### Unsupported operators:
To use unsupported operators like `XOR`, `NAND`and `NOR`, ypu have to break them down into their canonical forms as follows:
- `a XOR b` -> `(a AND NOT b) OR (NOT a AND b)`
- `a NAND b` -> `NOT (a AND b)`
- `a NOR b` -> `NOT (a OR b)`

### Syntax Usage
Boolean expressions in TBAL should be on a single line. Expressions on a new line are treated as their own distinct expressions. variables should always be lowercase, while the operators must always be uppercase.

## Using the `TBAL` interpreter
The TBAL interpreter is a CLI-only tool. It supports live interpretation by using a boolean expression asthe input to the interpreter:
```
tbal (a AND NOT b) OR (NOT a AND b)
```
It also can evaluate expressions from `.tbal` files, which allows batch-evaluation of multiple boolean expressions. Please note that doing so will generate multiple truth tables in one output, one for every expression.