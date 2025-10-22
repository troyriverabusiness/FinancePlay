//
//  MarketsView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

struct MarketsView: View {
    @State private var searchText: String = ""
    @State private var showMarketsInfo: Bool = false
    
    var markets: [Market] = [Market.amazon, Market.amazon, Market.amazon]
    
    var body: some View {
        NavigationStack {
            /// TODO: add filtering for Market Type & Search
            /// Stock, Crypto, ETF, ...
            ScrollView {
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

#Preview {
    MarketsView()
}
