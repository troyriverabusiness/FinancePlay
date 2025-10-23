//
//  Market.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import Foundation

struct Market: Identifiable {
    let id = UUID()
    
    var name: String
    /// Ticker for Stocks
    var ticker: String
    /// Specific stock, cryptocoin or ETF
    var baseAsset: String
    /// Latest Market price
    var price: Double
    
    var type: MarketType
    
    /// Logo for UI
    let logoURLString: String
    /// Historical prices
    var prices: [Double]
    /// Stock, Crypto, ETF,...
    
    // Mock Data
    static let amazon = Market(
        name: "Amazon",
        ticker: "AMZN",
        baseAsset: "Stock",
        price: 135.40,
        type: .Stock,
        logoURLString: "",
        prices: [
            135.60,
            135.80,
            140.0,
            138.90
        ]
    )
    
    /// List of Tickers (Symbol - AlphaVantage API) for the API
    static let top50: [String] = [
        "NVDA","MSFT","AAPL","GOOG","GOOGL","AMZN","META","AVGO","TSLA","BRK.A",
        "WMT","NVDA","HD","INTC","CMCSA","BAC","V","JNJ","XOM","PFE",
        "CVX","ORCL","ADBE","NFLX","AMD","ABT","CSCO","CRM","NKE","LIN",
        "DHR","MCD","ACN","PM","HON","IBM","UNH","LLY","ASML","COST",
        "PG","WBA","MMM","BA","AXP","GE","QCOM","TXN","SBUX","GS"
    ]
}
