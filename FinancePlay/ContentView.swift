//
//  ContentView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

struct ContentView: View {
    let test = Top50MarketsVM(markets: [])
    
    var body: some View {
        TabView {
            /// Markets Section
            Tab {
                MarketsView()
            } label: {
                Label("Markets", systemImage: "chart.line.uptrend.xyaxis")
            }
            /// Portfolio Section
            Tab {
                PortfolioView()
            } label: {
                Label("Portfolio", systemImage: "chart.pie")
            }
            /// Education Section
            Tab {
                EducationView()
            } label: {
                Label("Education", systemImage: "books.vertical")
            }
        }
        .task {
            try? await test.fetchBasicMarketInfo(ticker: "AMZN")
        }
    }
}

#Preview {
    ContentView()
}
