//
//  Quiz.swift
//  FinancePlay
//
//  Created by troy on 23.10.25.
//

struct Quiz {
    var topic: String
    var description: String
    /// Percentage of achieved score from the questions
    var score: Double
    /// The questions the quiz has
    var questions: [QuizQuestion]
    
    
    static let example = Quiz(topic: "Markets", description: "I hate bussies", score: 78.9, questions: QuizQuestion.marketQuestions)
}
