//
//  QuizQuestion.swift
//  FinancePlay
//
//  Created by troy on 23.10.25.
//

struct QuizQuestion {
    var question: String
    var answers: [String]
    var correctAnswer: String

    static let marketQuestions: [QuizQuestion] = [
        QuizQuestion(
            question: "What is a stock market?",
            answers: [
                "A place where companies sell products",
                "A system where shares of companies are bought and sold",
                "A bank that lends money",
                "A government office for taxes"
            ],
            correctAnswer: "A system where shares of companies are bought and sold"
        ),
        QuizQuestion(
            question: "What does it mean to own a share of a company?",
            answers: [
                "You are a customer of the company",
                "You own a small part of the company",
                "You work for the company",
                "You loaned money to the company"
            ],
            correctAnswer: "You own a small part of the company"
        ),
        QuizQuestion(
            question: "What is a bull market?",
            answers: [
                "A market where prices are generally rising",
                "A market where prices are falling",
                "A market for selling livestock",
                "A market that is closed"
            ],
            correctAnswer: "A market where prices are generally rising"
        ),
        QuizQuestion(
            question: "What is a bear market?",
            answers: [
                "A market where prices are generally falling",
                "A market full of new companies",
                "A market with no trading",
                "A market where prices never change"
            ],
            correctAnswer: "A market where prices are generally falling"
        ),
        QuizQuestion(
            question: "What is an index like the S&P 500?",
            answers: [
                "A single company",
                "A list showing the average performance of many companies",
                "A type of savings account",
                "A government bond"
            ],
            correctAnswer: "A list showing the average performance of many companies"
        ),
        QuizQuestion(
            question: "What does diversification help with?",
            answers: [
                "Increasing taxes",
                "Reducing risk by spreading investments",
                "Guaranteeing profits",
                "Predicting daily prices"
            ],
            correctAnswer: "Reducing risk by spreading investments"
        ),
        QuizQuestion(
            question: "What is a dividend?",
            answers: [
                "A fee you pay to trade",
                "Money a company may pay to shareholders from its profits",
                "A type of loan",
                "A stock that lost value"
            ],
            correctAnswer: "Money a company may pay to shareholders from its profits"
        ),
        QuizQuestion(
            question: "What does 'buy low, sell high' suggest?",
            answers: [
                "Buy when prices are high and sell when higher",
                "Buy when prices are lower and sell when they rise",
                "Never sell your investments",
                "Only buy popular stocks"
            ],
            correctAnswer: "Buy when prices are lower and sell when they rise"
        ),
        QuizQuestion(
            question: "What is market volatility?",
            answers: [
                "How often the market is open",
                "How quickly and widely prices move up or down",
                "The number of companies in the market",
                "The total amount of dividends paid"
            ],
            correctAnswer: "How quickly and widely prices move up or down"
        ),
        QuizQuestion(
            question: "What is a bond?",
            answers: [
                "Ownership in a company",
                "A loan to a government or company that pays interest",
                "A type of insurance",
                "A checking account"
            ],
            correctAnswer: "A loan to a government or company that pays interest"
        )
    ]
}
