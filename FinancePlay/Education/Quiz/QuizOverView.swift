//
//  QuizOverView.swift
//  FinancePlay
//
//  Created by troy on 23.10.25.
//

import SwiftUI

struct QuizOverView: View {
    let quiz: Quiz
    
    var body: some View {
        VStack {
            QuizInstructionsView(quiz: quiz)
            Spacer()
            StartQuizButton()
        }
        .padding()
        .navigationTitle("\(quiz.topic) Quiz")
        .navigationSubtitle("\(quiz.questions.count) Questions")
    }
}

private struct QuizInstructionsView: View {
    let quiz: Quiz
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text(quiz.description)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("This quiz contains \(quiz.questions.count) questions. There is no time limit. Only one answer is correct from the 4 given.")
                .font(.subheadline)
            Text("Good luck!")
                .font(.subheadline)
        }
    }
}

private struct StartQuizButton: View {
    var body: some View {
        Button {
            // TODO: Start quiz action
        } label: {
            Text("Start Quiz")
                .font(.headline)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
        .foregroundStyle(.white)
        .background(
            Capsule()
                .fill(Color.accentColor)
        )
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    QuizOverView(quiz: Quiz.example)
}
