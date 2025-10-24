//
//  AlphaVantageModels.swift
//  FinancePlay
//
//  Created by troy on 24.10.25.
//

import Foundation

// MARK: - AlphaVantage API Response Models

struct AlphaVantageResponse: Decodable {
    let metaData: MetaData
    let timeSeries: [String: TimeSeriesData]
    
    enum CodingKeys: String, CodingKey {
        case metaData = "Meta Data"
        case timeSeries = "Time Series (5min)"
    }
}

struct MetaData: Decodable {
    let information: String
    let symbol: String
    let lastRefreshed: String
    let interval: String
    let outputSize: String
    let timeZone: String
    
    enum CodingKeys: String, CodingKey {
        case information = "1. Information"
        case symbol = "2. Symbol"
        case lastRefreshed = "3. Last Refreshed"
        case interval = "4. Interval"
        case outputSize = "5. Output Size"
        case timeZone = "6. Time Zone"
    }
}

struct TimeSeriesData: Decodable {
    let open: String
    let high: String
    let low: String
    let close: String
    let volume: String
    
    enum CodingKeys: String, CodingKey {
        case open = "1. open"
        case high = "2. high"
        case low = "3. low"
        case close = "4. close"
        case volume = "5. volume"
    }
}

// MARK: - Reusable SpotPrice Decoding

extension SpotPrice {
    /// Creates a SpotPrice from AlphaVantage TimeSeriesData
    /// This is reusable for both stocks and crypto data
    static func fromAlphaVantage(_ data: TimeSeriesData, timestamp: String) -> SpotPrice? {
        guard let close = Double(data.close),
              let open = Double(data.open),
              let high = Double(data.high),
              let low = Double(data.low),
              let volume = Double(data.volume) else { return nil }
        
        // Parse the timestamp - AlphaVantage uses "YYYY-MM-DD HH:mm:ss" format
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "US/Eastern")
        
        guard let date = formatter.date(from: timestamp) else { return nil }
        
        return SpotPrice(
            price: close,
            time: date,
            open: open,
            high: high,
            low: low,
            volume: volume
        )
    }
}
