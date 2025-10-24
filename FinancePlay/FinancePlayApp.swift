//
//  FinancePlayApp.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

@main
struct FinancePlayApp: App {
//    @State private var marketVM = Top50MarketsVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(marketVM)
//                .task {
//                    do {
//                        try await marketVM.fetchMarkets()
//                    } catch {
//                        print("Bussi error when fetching top 50 market data")
//                    }
//                }
        }
    }
}
