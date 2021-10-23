//
//  QuizHelper.swift
//  HogwartsApp
//
//  Created by Maysa on 29/09/21.
//

import UIKit

class Question {
    var question : String?
    var answers : [Answer]!
    
    init (question: String, answers: [Answer]) {
        self.question = question
        self.answers = answers
    }
}

class Answer {
    var response: String!
    var isRight: Bool!
    
    init(answer: String, isRight: Bool) {
        self.response  = answer
        self.isRight = isRight
    }
}
