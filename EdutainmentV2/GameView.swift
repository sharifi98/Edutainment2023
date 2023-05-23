import SwiftUI

import SwiftUI

struct GameView: View {
    @Binding var gameIsActive: Bool
    @State private var currentQuestionIndex = 0
    @State private var currentAnswer = ""
    var questions: [Question]

    var body: some View {
        VStack {
            Text(questions[currentQuestionIndex].text)
            TextField("Your answer", text: $currentAnswer)
                .keyboardType(.numberPad)
            Button("Next question") {
                checkAnswerAndProceed()
            }
        }
    }

    func checkAnswerAndProceed() {
        if Int(currentAnswer) == questions[currentQuestionIndex].answer {
            currentQuestionIndex += 1
            if currentQuestionIndex == questions.count {
                gameIsActive = false
            }
        }
        currentAnswer = ""
    }
}


struct GameView_Previews: PreviewProvider {
    @State static var gameIsActive = true
    static var questions: [Question] = [
        Question(text: "2 x 2", answer: 4),
        Question(text: "3 x 3", answer: 9)
    ]

    static var previews: some View {
        GameView(gameIsActive: $gameIsActive, questions: questions)
    }
}
