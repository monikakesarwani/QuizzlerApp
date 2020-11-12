//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestion = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score : Int = 0
    var score1 : Int = 1
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //delcare a constant for holding first item from array and then set in questionLabel outlet
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
       
        
        if sender.tag == 1{
            pickedAnswer = true
           // print(pickedAnswer)
        } else if sender.tag == 2{
            pickedAnswer = false
            //print(pickedAnswer)
        }
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()
  
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        
      
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12{
            questionLabel.text = allQuestion.list[questionNumber].question
            updateUI()

        } else {
            let alert = UIAlertController(title: "Awsome", message: "You have finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
        
        
    }
    
    
    func checkAnswer() {
        
        //first define a constant named correctAnswer then set the value of answer
        let correctAnswer = allQuestion.list[questionNumber].answer
        
        // set the codition that if corretAnswer equal to pickedAnswer and print statement
        if correctAnswer == pickedAnswer {
        ProgressHUD.showSuccess("Correct")
            score += 1
            
            
        } else {
            ProgressHUD.showError("Wrong")
            
        }
        
    }
    
    
    func startOver() {
       questionNumber = 0
        score = 0
        
        nextQuestion()
       
    }
    

    
}
