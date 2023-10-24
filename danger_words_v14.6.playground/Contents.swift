

// Variable con listado de palabras secretas del incorporadas para el juego

let secretListOfDangerousWords = ["algorithm", "language", "compiler", "variable", "function", "loop", "class", "object", "inheritance", "polymorphism", "encapsulation", "modularity", "debugging", "integration", "development", "frontend", "backend", "database", "API", "framework", "library", "programmer", "syntax", "compilation", "interpretation", "link", "optimization", "repository", "constant"]
// funcion encargada de seleccionar una palabra secreta de manera aleatoria
func choosingWord(_ secretListOfDangerousWords: [String]) -> String {
    let dangerousWordAssignment = secretListOfDangerousWords.randomElement() ?? ""
    return dangerousWordAssignment
}
// funcion recorre la letra en la palabra secreta y muestra si la letra ingresada se encuentra en la palabra
func concordanceCheck(_ dangerousWordAssignment: String, _ listOfLettersFound: [Character]) {
    for letterEntered in dangerousWordAssignment {
        if listOfLettersFound.contains(letterEntered) {
            print(letterEntered, terminator: " ")
        } else {
            print("_", terminator: " ")
        }
    }
    print()
}
// funcion realiza las peticiones, verifica si no hay coincidencia, si coincide devuelve el dato encontrado
 
func controlOfEnteredLetters(_ listOfLettersFound: [Character]) -> Character {
    print("Enter a letter: ", terminator: "")
    var letterEntered = Character((readLine() ?? "").lowercased())
 
    while letterEntered.isLetter == false || String(letterEntered).count != 1 {
        print("Please enter only one letter: ", terminator: "")
        letterEntered = Character((readLine() ?? "").lowercased())
    }
 
    while listOfLettersFound.contains(letterEntered) {
        print("You already guessed that letter, try another one: ", terminator: "")
        letterEntered = Character((readLine() ?? "").lowercased())
    }
    return letterEntered
}

// funcion verifica y guarda las secuencias de avance,vidas, derrotas o victorias del juego
func gameControlDangerousWords() {
    print("Welcome to the Danger Words game!")
    let secretWord = choosingWord(secretListOfDangerousWords)
    var guessedLetter: [Character] = []
    var gameAttempts = 8

    while true {
        concordanceCheck(secretWord, guessedLetter)
        let validatedEnteredLetter = controlOfEnteredLetters(guessedLetter)
 
        if secretWord.contains(validatedEnteredLetter) {
            guessedLetter.append(validatedEnteredLetter)
            print("Well done! You guessed a letter.")
        } else {
            gameAttempts -= 1
            print("Sorry, that letter is not in the word.")
            print("You have \(gameAttempts) lives remaining.")
            if gameAttempts == 0 {
                print("Game Over! The word was: \(secretWord)")
                break
            } else if Set(secretWord).isSubset(of: Set(guessedLetter)) {
                print("Congratulations! You guessed the word: \(secretWord)")
                break
            }
        }
    }
}

// llamado de ejecucion y controles de juego
gameControlDangerousWords()

