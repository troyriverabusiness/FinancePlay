//
//  PortfolioView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

private enum PortfolioType {
    case diversity
    case historical
}

struct PortfolioView: View {
    @State private var showPortfolioInfo = false
    /// Whether to show historical data or diversity
    @State private var portfolioType: PortfolioType = .diversity
    
    var body: some View {
        NavigationStack {
            ScrollView {
                /// TODO: add a selection for whether historical or diversity (preferably as a toolbar)
                
                /// What Portfolio to Show
                switch portfolioType {
                    case .diversity:
                        PortfolioDiversityView()
                    case .historical:
                        PortfolioHistoricalView()
                }
            }
            .navigationTitle("Portfolio")
            .sheet(isPresented: $showPortfolioInfo) {
                PortfolioInfoView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showPortfolioInfo.toggle()
                    } label: {
                        Label("Info", systemImage: "info")
                    }

                }
            }
        }
    }
}

#Preview {
    PortfolioView()
}
