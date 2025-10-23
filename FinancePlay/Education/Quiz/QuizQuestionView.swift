//
//  QuizQuestionView.swift
//  FinancePlay
//
//  Created by troy on 23.10.25.
//

import SwiftUI

struct QuizQuestionView: View {
    let question: QuizQuestion
    
    var body: some View {
        VStack(spacing: 40) {
            /// Question asked visibly
            Text(question.question)
                .font(.title2)
            
            /// Show the 4 answers in pill-shaped container
            QuizAnswerOptionsView(question: question)
        }
    }
}

private struct QuizAnswerOptionsView: View {
    let question: QuizQuestion
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(question.answers, id: \.self) { answer in
                QuizAnswerOptionPill(answer: answer)
            }
        }
    }
}

private struct QuizAnswerOptionPill: View {
    let answer: String

    var body: some View {
        Text(answer)
            .font(.caption)
            .padding()
            .background(
                Capsule()
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}

#Preview {
    QuizQuestionView(question: QuizQuestion.marketQuestions.first!)
}
