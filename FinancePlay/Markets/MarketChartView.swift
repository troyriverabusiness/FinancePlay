//
//  MarketChartView.swift
//  FinancePlay
//
//  Created by troy on 22.10.25.
//

import SwiftUI
import Charts

private enum TimeSeries: String, CaseIterable, Identifiable {
    case day = "1D"
    case week = "1W"
    case month = "1M"
    case year = "1Y"
    var id: Self { self }
}

// AI Generated Mock Data
struct StockPrice: Identifiable {
    let id = UUID()
    let date: Date
    let price: Double
    
    // Sample data
    static let sample: [StockPrice] = [
        StockPrice(date: Date().addingTimeInterval(-6*24*60*60), price: 131),
        StockPrice(date: Date().addingTimeInterval(-5*24*60*60), price: 129),
        StockPrice(date: Date().addingTimeInterval(-4*24*60*60), price: 134),
        StockPrice(date: Date().addingTimeInterval(-3*24*60*60), price: 138),
        StockPrice(date: Date().addingTimeInterval(-2*24*60*60), price: 136),
        StockPrice(date: Date().addingTimeInterval(-1*24*60*60), price: 140),
        StockPrice(date: Date(), price: 142)
    ]
}

struct MarketChartView: View {
    let market: Market
    @State private var timeSeries: TimeSeries = .year
    
    var body: some View {
        VStack {
            /// Adjust the scale to not start from 0
            let minY = (StockPrice.sample.map(\.price).min() ?? 0) - 2
            let maxY = (StockPrice.sample.map(\.price).max() ?? 0) + 2
            
            /// Chart
            Chart {
                ForEach(StockPrice.sample) { point in
                    LineMark(
                        x: .value("Date", point.date),
                        y: .value("Price", point.price)
                    )
                    .foregroundStyle(.blue)
                    .lineStyle(StrokeStyle(lineWidth: 2))
                    
                    PointMark(
                        x: .value("Date", point.date),
                        y: .value("Price", point.price)
                    )
                    .foregroundStyle(.blue)
                }
            }
            .frame(width: 300, height: 300)
            .chartYScale(domain: minY...maxY)

            
            
            // Picker for Chart's detail
            TimeSeriesPicker(selection: $timeSeries)
        }
    }
}

private struct TimeSeriesPicker: View {
    @Binding var selection: TimeSeries
    
    var body: some View {
        Picker("Time Series", selection: $selection) {
            ForEach(TimeSeries.allCases) { tab in
                Text(tab.rawValue).tag(tab)
            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
}

#Preview {
    MarketChartView(market: Market.amazon)
}
