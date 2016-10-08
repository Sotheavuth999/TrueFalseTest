//
//  ViewController.swift
//  True False Test
//
//  Created by SOTHEAVUTH NGUON on 10/8/16.
//  Copyright © 2016 SOTHEAVUTH NGUON. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTitleOUTLET: UILabel!
    @IBOutlet weak var lblQuestionOUTLET: UILabel!
    @IBOutlet weak var btnTrueOUTLET: UIButton!
    @IBOutlet weak var btnFalseOUTLET: UIButton!
    @IBOutlet weak var lblScoreOUTLET: UILabel!
    @IBOutlet weak var btnNewGameOUTLET: UIButton!
    
    var listOfQuestions : [String] = []
    var listOFAnswers : [Bool] = []
    var hasBeenAnswered : [Bool] = []
    var currentQuestion : String?
    var currentAnswer : Bool?
    var score = 0
    var randomNumber : Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        listOfQuestions = [
            "The capital of BC is Vancouver",
            "5 squared is 25",
            "All insects have 6 legs",
            "Peppers are vegetables"
        ]
        
        listOFAnswers = [false, true, true, false]
        
        hasBeenAnswered = [false, false, false, false]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressTrueButtonACTION(_ sender: UIButton) {
        if (currentAnswer == true) {
            score = score + 1
            lblScoreOUTLET.text = "Correct! Your score is now " + String(score) + " points."
        } else {
            lblScoreOUTLET.text = "Incorrect! Your score is still " + String(score) + " points."
        }
        
        initiateEndGameSequence()
        
    }
    @IBAction func pressFalseButtonACTION(_ sender: UIButton) {
        if (currentAnswer == false) {
            score = score + 1
            lblScoreOUTLET.text = "Correct! Your score is now " + String(score) + " points."
        } else {
            lblScoreOUTLET.text = "Incorrect! Your score is still " + String(score) + " points."
        }
        initiateEndGameSequence()
    }
    @IBAction func pressNewGameButtonACTION(_ sender: UIButton) {
        for index in 0..<listOfQuestions.count {
            hasBeenAnswered[index] = false
        }
        chooseQuestion()
        score = 0
        lblScoreOUTLET.text = "Score:"
        btnTrueOUTLET.isEnabled = true
        btnFalseOUTLET.isEnabled = true
    }
    
    func initiateEndGameSequence() {
        if checkIfOver() == true {
            lblQuestionOUTLET.text = "You reach the end of the game. Your final score is \(String(score)) / \(String(listOfQuestions.count)) points."
        } else {
            chooseQuestion()
        }
    }
    func chooseRandomNumber() {
        randomNumber = Int(arc4random_uniform(UInt32(listOfQuestions.count)))
        if (hasBeenAnswered[randomNumber!] == true) {
            chooseRandomNumber()
        }
        hasBeenAnswered[randomNumber!] = true
    }
    func chooseQuestion(){
        chooseRandomNumber()
        currentQuestion = listOfQuestions[randomNumber!]
        currentAnswer = listOFAnswers[randomNumber!]
        lblQuestionOUTLET.text = currentQuestion!
    }
    func checkIfOver() -> Bool {
        for index in 0..<listOfQuestions.count {
            if (hasBeenAnswered[index] == false) {
                return false
            }
        }
        btnTrueOUTLET.isEnabled = false
        btnFalseOUTLET.isEnabled = false
        return true
    }

}

