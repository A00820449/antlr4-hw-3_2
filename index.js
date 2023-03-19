import GrammarLexer from "./lib/GrammarLexer.js"
import GrammarParser from "./lib/GrammarParser.js"
import antlr4 from "antlr4"
import fs from "node:fs"

const input = fs.readFileSync("input.txt").toString()

const chars = new antlr4.InputStream(input)
const lexer = new GrammarLexer(chars)
const tokens = new antlr4.CommonTokenStream(lexer)
const parser = new GrammarParser(tokens)

parser.buildParseTrees = true
parser._errHandler = new antlr4.error.BailErrorStrategy() /* Aborts parsing when an error is encountered */

try {
    parser.start()
    console.log("ACCEPTED")
}
catch(e) {
    console.error("syntax error")
}