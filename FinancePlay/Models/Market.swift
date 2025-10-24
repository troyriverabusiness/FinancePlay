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
    var prices: [SpotPrice]
    /// Stock, Crypto, ETF,...
    
    init(name: String, ticker: String, baseAsset: String, price: Double, type: MarketType, logoURLString: String, prices: [SpotPrice]) {
        self.name = name
        self.ticker = ticker
        self.baseAsset = baseAsset
        self.price = price
        self.type = type
        self.logoURLString = logoURLString
        self.prices = prices
    }
    
    
    // Mock Data
    static let amazon = Market(
        name: "Amazon",
        ticker: "AMZN",
        baseAsset: "Stock",
        price: 135.40,
        type: .Stock,
        logoURLString: "",
        prices: [
            SpotPrice(price: 135.60, time: Date().addingTimeInterval(-3 * 24 * 60 * 60)),
            SpotPrice(price: 135.80, time: Date().addingTimeInterval(-2 * 24 * 60 * 60)),
            SpotPrice(price: 140.00, time: Date().addingTimeInterval(-1 * 24 * 60 * 60)),
            SpotPrice(price: 138.90, time: Date())
        ]
    )
    
    /// List of Tickers (Symbol - AlphaVantage API) for the API
    static let top50: [String] = [
        "NVDA","MSFT","AAPL","GOOG","GOOGL","AMZN","META","AVGO","TSLA","BRK-A",
        "WMT","NVDA","HD","INTC","CMCSA","BAC","V","JNJ","XOM","PFE",
        "CVX","ORCL","ADBE","NFLX","AMD","ABT","CSCO","CRM","NKE","LIN",
        "DHR","MCD","ACN","PM","HON","IBM","UNH","LLY","ASML","COST",
        "PG","WBA","MMM","BA","AXP","GE","QCOM","TXN","SBUX","GS"
    ]
    
    /// Initialize Market from AlphaVantage API response with only the latest 2 prices
    init(from alphaVantageResponse: AlphaVantageResponse, latestOnly: Bool = true) {
        self.name = alphaVantageResponse.metaData.symbol
        self.ticker = alphaVantageResponse.metaData.symbol
        self.baseAsset = "Stock" // Default for AlphaVantage stock data
        self.type = .Stock
        self.logoURLString = "" // Will be populated separately if needed
        
        // Convert time series data to SpotPrice array
        var spotPrices: [SpotPrice] = []
        for (timestamp, timeSeriesData) in alphaVantageResponse.timeSeries {
            if let spotPrice = SpotPrice.fromAlphaVantage(timeSeriesData, timestamp: timestamp) {
                spotPrices.append(spotPrice)
            }
        }
        
        // Sort by time (most recent first)
        let sortedPrices = spotPrices.sorted { $0.time > $1.time }
        
        if latestOnly {
            // Take only the 2 latest prices
            self.prices = Array(sortedPrices.prefix(2))
        } else {
            // Use all prices
            self.prices = sortedPrices
        }
        
        // Set the latest price
        self.price = self.prices.first?.price ?? 0.0
    }
}

