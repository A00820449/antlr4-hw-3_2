import GrammarListener from "./lib/GrammarListener.js";

export default class Listener extends GrammarListener {
    exitStart(ctx) {
        console.log("ACCEPTED")
    }
}