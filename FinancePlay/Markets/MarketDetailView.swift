//
//  MarketDetailView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

/// Detailed Market View which shows all relevant info
struct MarketDetailView: View {
    let market: Market
    
    var body: some View {
        ScrollView {
            VStack {
                MarketPriceStat2(market: market)
                // Add main Chart
                MarketChartView(market: market)
                
                // Add table with details
                
                // Add 3 news articles?
            }
            .navigationTitle(market.name)
            .navigationSubtitle(market.ticker)
        }
    }
}

private struct MarketPriceStat2: View {
    let market: Market
    var isProfit: Bool = true
    
    var body: some View {
        HStack {
            Text("\(market.price.description) €")
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()
            Text("+1.45%")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(isProfit ? .green : .red)
        }
        .padding()
    }
}

#Preview {
    MarketDetailView(market: Market.amazon)
}
