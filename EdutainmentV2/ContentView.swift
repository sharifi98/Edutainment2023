//
//  ContentView.swift
//  EdutainmentV2
//
//  Created by Hossein Sharifi on 23/05/2023.
//

import SwiftUI

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var gameIsActive = false
    @State private var tableSelection = 1
    @State private var questionCount = 5

    var body: some View {
        Group {
            if gameIsActive {
                GameView(gameIsActive: $gameIsActive, questions: generateQuestions(tableSelection: tableSelection, questionCount: questionCount))
            } else {
                SettingsView(gameIsActive: $gameIsActive, tableSelection: $tableSelection, questionCount: $questionCount)
            }
        }
    }
    
    func generateQuestions(tableSelection: Int, questionCount: Int) -> [Question] {
        var questions: [Question] = []
        for _ in 0..<questionCount {
            let randomNumber = Int.random(in: 1...10)
            let questionText = "\(tableSelection) x \(randomNumber)"
            let answer = tableSelection * randomNumber
            questions.append(Question(text: questionText, answer: answer))
        }
        return questions
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
