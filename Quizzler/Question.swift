//
//  Question.swift
//  Quizzler
//
//  Created by Anil on 9/5/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation


class Question{
    let question: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        self.question = text
        self.answer = correctAnswer
    }
    
    
    
}
