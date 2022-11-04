//
//  ViewController.swift
//  Question Quiz
//
//  Created by Ivan Behichev on 02.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var optionTwoButton: UIButton!
    @IBOutlet weak var optionOneButton: UIButton!
    @IBOutlet weak var optionThreeButton: UIButton!
    @IBOutlet weak var questionsProgressView: UIProgressView!
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        guard let userAnswer = sender.currentTitle else { return }
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.updateUI()
        }
    }
    
    func updateUI() {
        let answerOptions = quizBrain.getAnswers()
        optionOneButton.setTitle(answerOptions[0], for: .normal)
        optionTwoButton.setTitle(answerOptions[1], for: .normal)
        optionThreeButton.setTitle(answerOptions[2], for: .normal)
        
        questionTextLabel.text = quizBrain.getQuestionText()
        questionsProgressView.progress = quizBrain.getProgress()
        scoreLabel.text = "Score:\(quizBrain.getScore())"
        
        optionOneButton.backgroundColor = #colorLiteral(red: 0.2784313725, green: 0.7098039216, blue: 1, alpha: 1)
        optionTwoButton.backgroundColor = #colorLiteral(red: 0.2784313725, green: 0.7098039216, blue: 1, alpha: 1)
        optionThreeButton.backgroundColor = #colorLiteral(red: 0.2784313725, green: 0.7098039216, blue: 1, alpha: 1)
        
        
    }
    
    
}

