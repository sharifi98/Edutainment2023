//
//  Questions.swift
//  EdutainmentV2
//
//  Created by Hossein Sharifi on 23/05/2023.
//

import Foundation

struct Question {
    let text: String
    let answer: Int
}

func generateQuestions(tableSelection: Int, questionCount: Int) -> [Question] {
    var questions = [Question]()
    
    for _ in 1...questionCount {
        let multiplier = Int.random(in: 1...tableSelection)
        let answer = tableSelection * multiplier
        let question = Question(text: "What is \(tableSelection) x \(multiplier)?", answer: answer)
        questions.append(question)
    }
    
    return questions
    
}
