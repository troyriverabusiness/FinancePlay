//
//  MarketHeadView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

/// Individual Market Header used in Lists
struct MarketHeadView: View {
    let market: Market
    
    var body: some View {
        HStack {
            MarketLogo(market: market)
            MarketNameTicker(market: market)
            Spacer()
            MarketPriceStat(market: market)
        }
        .padding()
    }
}

/// Market Logo / Fallback Image
 struct MarketLogo: View {
    let market: Market
    
    var body: some View {
        Image(systemName: "bitcoinsign.bank.building")
    }
}

/// Market Name & Ticker
 struct MarketNameTicker: View {
    let market: Market
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(market.name)
            Text(market.ticker)
        }
    }
}

/// Latest market price & percent difference from yesterday's date
 struct MarketPriceStat: View {
    let market: Market
    
    var body: some View {
        VStack {
            Text("\(market.price.description) €")
            Text("+1.45%")
        }
    }
}

#Preview {
    MarketHeadView(market: Market.amazon)
}
