//
//  Top50MarketsVM.swift
//  FinancePlay
//
//  Created by troy on 24.10.25.
//

import Foundation

struct Top50MarketsVM {
    
    /// 50 biggest markets
    var markets: [Market]
    
    var tickers: [String] = Market.top50
    
    
    let baseURL = "https://www.alphavantage.co/query"
    
    func fetchMarkets() {
        
    }
    
    /// Fetch lightweigth info (Name, Latest 2 close prices, ...) based on a Ticker
    func fetchBasicMarketInfo(ticker: String) async throws {
    
        /// TODO: Refactor this function into reusable components
        /// Add Query components to the URL
        guard var components = URLComponents(string: baseURL) else {
            throw NetworkError.invalidURL
        }
        components.queryItems = [
            URLQueryItem(name: "function", value: "TIME_SERIES_INTRADAY"),
            URLQueryItem(name: "symbol", value: ticker),
            URLQueryItem(name: "interval", value: "5min"),
            URLQueryItem(name: "apikey", value: "demo")
        ]
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        print("Request URL: \(url.absoluteString)")
        
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let http = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        /// Throw server errors
        guard (200...299).contains(http.statusCode) else {
            throw NetworkError.serverError(statusCode: http.statusCode)
        }
        
        /// Ensure response-data is present
        guard !data.isEmpty else {
            print("Empty response for ticker: \(ticker)")
            throw NetworkError.invalidResponse
        }
        
        /// Decode the response-body
        do {
            let payload = try JSONDecoder().decode(AVIntradayResponse.self, from: data)
            
            /// TODO: add sorting for latest (already returned by API so idk)
            print(payload.metaData)
            
        } catch {
            // AI: Fallback: print a small snippet to aid debugging
            if let snippet = String(data: data, encoding: .utf8)?.prefix(160) {
                print("Decoding failed for \(ticker). Snippet: \(snippet)… Error: \(error)")
            } else {
                print("Decoding failed for \(ticker). Error: \(error)")
            }
        }
    }
    
    
}

// MARK: - Alpha Vantage Intraday Models (file-scoped)
fileprivate struct AVIntradayResponse: Decodable {
    let metaData: MetaData
    let timeSeries: [String: OHLC]
    enum CodingKeys: String, CodingKey {
        case metaData = "Meta Data"
        case timeSeries = "Time Series (5min)"
    }
}

fileprivate struct MetaData: Decodable {
    let symbol: String
    enum CodingKeys: String, CodingKey { case symbol = "2. Symbol" }
}

/// Correct names & Coding keys (AI)
fileprivate struct OHLC: Decodable {
    let open: String
    let high: String
    let low: String
    let close: String
    let volume: String
    enum CodingKeys: String, CodingKey {
        case open = "1. open"
        case high = "2. high"
        case low = "3. low"
        case close = "4. close"
        case volume = "5. volume"
    }
}
