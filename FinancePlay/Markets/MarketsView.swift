//
//  MarketsView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

private enum MarketType: String, CaseIterable, Identifiable {
    case all = "All"
    case Stock = "Stock"
    case Crypto = "Crypto"
    case ETF = "ETF"
    var id: Self { self }
}

struct MarketsView: View {
    @State private var searchText: String = ""
    @State private var showMarketsInfo: Bool = false
    @State private var selectedMarketType: MarketType = .all
    
    var markets: [Market] = [Market.amazon, Market.amazon, Market.amazon]
    
    var body: some View {
        NavigationStack {
            /// TODO: add filtering for Market Type & Search
            /// Stock, Crypto, ETF, ...
            ScrollView {
                MarketTypePicker(marketType: $selectedMarketType)
                MarketsListView(markets: markets)
            }
            .toolbar {
                ToolbarItem {
                    Button("Hello", systemImage: "info") {
                        showMarketsInfo.toggle()
                    }
                }
            }
            .navigationTitle("Markets")
            .searchable(text: .constant(""))
            /// Sheet which presents education content on what markets are etc...
            .sheet(isPresented: $showMarketsInfo) {
                MarketsInfo()
            }
        }
    }
}

private struct MarketTypePicker: View {
    @Binding var marketType: MarketType
    
    var body: some View {
        Picker("Type", selection: $marketType) {
            ForEach(MarketType.allCases) { tab in
                Text(tab.rawValue).tag(tab)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
    }
}

#Preview {
    MarketsView()
}
