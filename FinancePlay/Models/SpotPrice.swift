//
//  SpotPrice.swift
//  FinancePlay
//
//  Created by troy on 24.10.25.
//
import Foundation

struct SpotPrice: Identifiable {
    let id = UUID()
    var price: Double
    var time: Date
}
