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
    
    /// Logo for UI
    let logoURLString: String
    
    /// Historical prices
    var prices: [Double]
    
    // Mock Data
    static let amazon = Market(
        name: "Amazon",
        ticker: "AMZN",
        baseAsset: "Stock",
        price: 135.40,
        logoURLString: "",
        prices: [
            135.60,
            135.80,
            140.0,
            138.90
        ]
    )
}
