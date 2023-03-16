import GrammarLexer from "./lib/GrammarLexer.js"
import GrammarParser from "./lib/GrammarParser.js"
import Listener from "./listener.js"
import antlr4 from "antlr4"
import fs from "node:fs"

const input = fs.readFileSync("input.txt")

const chars = new antlr4.InputStream(input)
const lexer = new GrammarLexer(chars)
const tokens = new antlr4.CommonTokenStream(lexer)
const parser = new GrammarParser(tokens)

const listener = new Listener()

parser.buildParseTrees = true
parser.addParseListener(listener)

parser.start()