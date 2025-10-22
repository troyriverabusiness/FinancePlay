//
//  MarketsListView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

struct MarketsListView: View {
    var markets: [Market]
    
    var body: some View {
        ForEach(markets) { market in
            Text(market.name)
        }
    }
}

#Preview {
    MarketsListView(markets: [Market.amazon, Market.amazon])
}
