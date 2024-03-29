//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Our strings
    let story1 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\"."
    let answer1a = "I\'ll hop in. Thanks for the help!"
    let answer1b = "Better ask him if he\'s a murderer first."
    
    
    let story2 = "He nods slowly, unphased by the question."
    let answer2a = "At least he\'s honest. I\'ll climb in."
    let answer2b = "Wait, I know how to change a tire."
    
    let story3 = "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
    let answer3a = "I love Elton John! Hand him the cassette tape."
    let answer3b = "It\'s him or me! You take the knife and stab him."
    
    let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
    let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    var storyIndex = 1
    var stories : Array<String> = []
    var answersA : Array<String> = []
    var answersB : Array<String> = []
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyTextView.text = story1;
        topButton.setTitle(answer1a, for: .normal)
        bottomButton.setTitle(answer1b, for: .normal)
        restartButton.isHidden = true
        
        stories = [story1, story2, story3, story4, story5, story6]
        answersA = [answer1a, answer2a, answer3a]
        answersB = [answer1b, answer2b, answer3b]
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            if storyIndex == 1 || storyIndex == 2 {
                storyIndex = 3
            } else if storyIndex == 3 {
                storyIndex = 6
            }
        } else if sender.tag == 2 {
            if storyIndex == 1 {
                storyIndex = 2
            } else if storyIndex == 3 {
                storyIndex = 5
            } else if storyIndex == 2 {
                storyIndex = 4
            }
        }
        
        updateUI()
    }
    
    func updateUI() {
        storyTextView.text = stories[storyIndex - 1]
        if storyIndex <= 3 {
            topButton.setTitle(answersA[storyIndex - 1], for: .normal)
            bottomButton.setTitle(answersB[storyIndex - 1], for: .normal)
        } else {
            topButton.isHidden = true
            bottomButton.isHidden = true
        }
        
        if storyIndex == 6 || storyIndex == 5 || storyIndex == 4 {
            restartButton.isHidden = false
        }
    }
    
    func startOver() {
        storyIndex = 1
        updateUI()
        topButton.isHidden = false
        bottomButton.isHidden = false
        restartButton.isHidden = true
    }

    @IBAction func restartPressed(_ sender: Any) {
        startOver()
    }
}

