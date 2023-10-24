let w = ["algorithm", "language", "compiler", "variable", "function", "loop", "class", "object", "inheritance", "polymorphism", "encapsulation", "modularity", "debugging", "integration", "development", "frontend", "backend", "database", "API", "framework", "library", "programmer", "syntax", "compilation", "interpretation", "link", "optimization", "repository", "constant"]
 
func cw(_ w: [String]) -> String {
    let s = w.randomElement() ?? ""
    return s
}
 
func sw(_ s: String, _ gl: [Character]) {
    for l in s {
        if gl.contains(l) {
            print(l, terminator: " ")
        } else {
            print("_", terminator: " ")
        }
    }
    print()
}
 
func take(_ gl: [Character]) -> Character {
    print("Enter a letter: ", terminator: "")
    var l = Character((readLine() ?? "").lowercased())
 
    while l.isLetter == false || String(l).count != 1 {
        print("Please enter only one letter: ", terminator: "")
        l = Character((readLine() ?? "").lowercased())
    }
 
    while gl.contains(l) {
        print("You already guessed that letter, try another one: ", terminator: "")
        l = Character((readLine() ?? "").lowercased())
    }
    return l
}
 
func dangerWords() {
    print("Welcome to the Danger Words game!")
    let secret = cw(w)
    var guessed: [Character] = []
    var trys = 8
 
    while true {
        sw(secret, guessed)
        let L = take(guessed)
 
        if secret.contains(L) {
            guessed.append(L)
            print("Well done! You guessed a letter.")
        } else {
            trys -= 1
            print("Sorry, that letter is not in the word.")
            print("You have \(trys) lives remaining.")
 
            if trys == 0 {
                print("Game Over! The word was: \(secret)")
                break
            } else if Set(secret).isSubset(of: Set(guessed)) {
                print("Congratulations! You guessed the word: \(secret)")
                break
            }
        }
    }
}
 
dangerWords()
