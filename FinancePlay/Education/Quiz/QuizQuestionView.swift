//
//  QuizQuestionView.swift
//  FinancePlay
//
//  Created by troy on 23.10.25.
//

import SwiftUI

/// Presentational View that is the same for each question type
struct QuizQuestionView: View {
    let question: QuizQuestion
    
    var body: some View {
        VStack(spacing: 40) {
            /// Question asked visibly
            Text(question.question)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            /// Show the 4 answers in pill-shaped container
            QuizAnswerOptionsView(question: question)
            Spacer()
            /// Next  question button
            NextQuestionButton(onTap: {})
            // Disabled until an option is selected
                .disabled(true)
        }
        .padding(.vertical, 120)
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

private struct NextQuestionButton: View {
    let onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Text("Next Question")
                .font(.headline)
                .padding(.vertical, 12)
        }
        .padding(.horizontal, 40)
        .foregroundStyle(.white)
        .background(
            Capsule()
                .fill(Color.accentColor)
        )
    }
}

#Preview {
    QuizQuestionView(question: QuizQuestion.marketQuestions.first!)
}
