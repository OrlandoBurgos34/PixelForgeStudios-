//
//  ViewController.swift
//  PixelForgeStudios
//
//  Created by DanielApps on 25/10/23.
//

import UIKit

class ViewController: UIViewController {
    
 
    let secretListOfDangerousWords = ["algorithm", "language", "compiler", "variable", "function", "loop", "class", "object", "inheritance", "polymorphism", "encapsulation", "modularity", "debugging", "integration", "development", "frontend", "backend", "database", "API", "framework", "library", "programmer", "syntax", "compilation", "interpretation", "link", "optimization", "repository", "constant"]
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var secretWordLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!

    var secretWord = ""
    var guessedLetters: [Character] = []
    var gameAttempts = 8

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }

    func startNewGame() {
        gameAttempts = 8
        guessedLetters = []
        secretWord = choosingWord(secretListOfDangerousWords)
        secretWordLabel.text = ""
        messageLabel.text = "Welcome to the Danger Words game!"
        concordanceCheck(secretWord, guessedLetters)
    }

    func choosingWord(_ words: [String]) -> String {
        return words.randomElement() ?? ""
    }

    func concordanceCheck(_ word: String, _ lettersFound: [Character]) {
        var displayWord = ""
        for letterEntered in word {
            if lettersFound.contains(letterEntered) {
                displayWord.append(letterEntered)
            } else {
                displayWord.append("_")
            }
        }
        secretWordLabel.text = displayWord
    }

    @IBAction func startTheGame(_ sender: Any) {
        startNewGame()
        startButton.isEnabled = false
        restartButton.isEnabled = true
    }

    @IBAction func enterALetter(_ sender: Any) {
        if let letter = textField.text?.lowercased().first {
            textField.text = ""
            processEnteredLetter(letter)
        }
    }

    func processEnteredLetter(_ letter: Character) {
        if gameAttempts > 0 {
            if !guessedLetters.contains(letter) {
                guessedLetters.append(letter)
                if secretWord.contains(letter) {
                    messageLabel.text = "Well done! You guessed a letter."
                } else {
                    gameAttempts -= 1
                    messageLabel.text = "Sorry, that letter is not in the word. You have \(gameAttempts) lives remaining."
                }
                concordanceCheck(secretWord, guessedLetters)
                if Set(secretWord).isSubset(of: Set(guessedLetters)) {
                    messageLabel.text = "Congratulations! You guessed the word: \(secretWord)"
                    restartButton.isEnabled = false
                }
            }
        } else {
            messageLabel.text = "Game Over! The word was: \(secretWord)"
            restartButton.isEnabled = false
        }
    }
}
