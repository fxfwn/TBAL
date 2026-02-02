cmake_minimum_required(VERSION 2.25)

project(TBAL LANGUAGES Swift)

#Library target for ParserLexer
add_library(ParserLexer STATIC
    ParserLexer/Sources/Token.swift
    ParserLexer/Sources/Parser.swift
    ParserLexer/Sources/lexer.swift
)

#Executable target for the Interpreter
add_executable(TBALInterp
    Interpreter/main.swift
)

#link lib to interpreter
target_link_libraries(TBALInterp PRIVATE ParserLexer)

#specify Swift flags
set_target_properties(ParserLexer PROPERTIES
    SWIFT_MODULE_NAME ParserLexer
)

set_target_properties(TBALInterp PROPERTIES
    SWIFT_MODULE_NAME TBALInterp
)