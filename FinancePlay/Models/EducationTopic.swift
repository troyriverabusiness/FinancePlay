//
//  EducationTopic.swift
//  FinancePlay
//
//  Created by troy on 23.10.25.
//
import Foundation

struct EducationTopic: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    /// Paragraphs which explain the topic
    var explanation: [String]
    /// Visual information for more engagement
    var infographics: [String]?
    
    
    
    
    /// Sample Topics with AI generated explanations
    static let topics: [EducationTopic] = [
        EducationTopic(
            name: "Markets",
            description: "Markets are places—physical or digital—where buyers and sellers trade assets like stocks, bonds, and commodities.",
            explanation: [
                "Financial markets match supply and demand for capital, enabling companies to raise money and investors to deploy savings.",
                "Prices move based on new information, expectations, liquidity, and risk appetite. Over time, markets tend to reflect fundamentals.",
                "Common market segments include equities (stocks), fixed income (bonds), foreign exchange (currencies), and commodities.",
                "Market indices (like the S&P 500) track baskets of securities to represent overall performance of a segment or strategy."
            ]
        ),
        EducationTopic(
            name: "Portfolio",
            description: "A portfolio is a collection of assets designed to achieve specific risk and return goals.",
            explanation: [
                "Diversification reduces the impact of any single asset by spreading exposure across sectors, regions, and asset classes.",
                "Asset allocation (the mix of stocks, bonds, cash, and alternatives) is the primary driver of long-term returns and volatility.",
                "Rebalancing brings a portfolio back to target weights, systematically selling outperformers and buying underperformers.",
                "Risk management includes position sizing, correlation awareness, and scenario analysis to handle drawdowns."
            ]
        ),
        EducationTopic(
            name: "Taxes",
            description: "Taxes affect your net returns; planning can improve after-tax outcomes without changing risk.",
            explanation: [
                "Understand account types: taxable, tax-deferred (e.g., traditional retirement), and tax-advantaged (e.g., Roth).",
                "Tax-efficient asset location places tax-inefficient assets in tax-advantaged accounts when possible.",
                "Realizing gains creates tax liabilities; harvesting losses may offset gains subject to local rules.",
                "Always consult a qualified tax professional for guidance specific to your jurisdiction and situation."
            ]
        ),
        EducationTopic(
            name: "Investing",
            description: "Investing is allocating capital today with the expectation of future growth or income.",
            explanation: [
                "Define goals and time horizons; longer horizons can tolerate more volatility for higher expected returns.",
                "Compounding magnifies small, consistent gains over time—starting early often matters more than timing perfection.",
                "Costs and fees reduce returns; prefer low-cost, transparent vehicles when appropriate.",
                "Stick to a disciplined process; avoid emotional decisions driven by short-term market noise."
            ]
        )
    ]
}
