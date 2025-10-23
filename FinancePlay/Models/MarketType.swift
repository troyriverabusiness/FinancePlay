//
//  MarketType.swift
//  FinancePlay
//
//  Created by troy on 24.10.25.
//


enum MarketType: String, CaseIterable, Identifiable {
    case all = "All"
    case Stock = "Stock"
    case Crypto = "Crypto"
    case ETF = "ETF"
    var id: Self { self }
}
