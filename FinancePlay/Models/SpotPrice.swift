//
//  SpotPrice.swift
//  FinancePlay
//
//  Created by troy on 24.10.25.
//
import Foundation

struct SpotPrice: Identifiable, Decodable {
    var id = UUID()
    var price: Double
    var time: Date
    
    /// Additional OHLCV data for comprehensive price analysis
    var open: Double?
    var high: Double?
    var low: Double?
    var volume: Double?
    
    init(price: Double, time: Date, open: Double? = nil, high: Double? = nil, low: Double? = nil, volume: Double? = nil) {
        self.price = price
        self.time = time
        self.open = open
        self.high = high
        self.low = low
        self.volume = volume
    }
}
