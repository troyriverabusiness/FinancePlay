//
//  PortfolioView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI

private enum PortfolioType: String, CaseIterable, Identifiable {
    case diversity = "Portfolio Diversity"
    case historical = "Historical Value"
    var id : Self { self }
}

struct PortfolioView: View {
    @State private var showPortfolioInfo = false
    /// Whether to show historical data or diversity
    @State private var portfolioType: PortfolioType = .diversity
    
    var body: some View {
        NavigationStack {
            ScrollView {
                /// TODO: move this into toolbar
                /// Picker to specify what type of portfolio view
                PortfolioTypePicker(portfolioType: $portfolioType)
                
                
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

private struct PortfolioTypePicker: View {
    @Binding var portfolioType: PortfolioType
    
    var body: some View {
        Picker("Type", selection: $portfolioType) {
            ForEach(PortfolioType.allCases) { tab in
                Text(tab.rawValue).tag(tab)
            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
}

#Preview {
    PortfolioView()
}
