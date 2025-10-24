//
//  Top50MarketsVM.swift
//  FinancePlay
//
//  Created by troy on 24.10.25.
//

import Foundation

@Observable
class Top50MarketsVM {
    
    /// 50 biggest markets
    var markets: [Market] = []
    
    var tickers: [String] = Market.top50
    
    let baseURL = "https://www.alphavantage.co/query"
    
    let apiKey = Bundle.main.object(forInfoDictionaryKey: "ALPHA_VANTAGE_API_KEY") as? String

    init() {
        
    }
    
    /// Fetch all 50 markets with their latest prices
    @MainActor
    func fetchMarkets() async throws {
        for ticker in tickers {
            markets.append(try await fetchBasicMarketInfo(ticker: ticker))
        }
    }
    
    /// Fetch market info for a specific ticker and return a Market object
    func fetchBasicMarketInfo(ticker: String) async throws -> Market {
        /// Add Query components to the URL
        guard var components = URLComponents(string: baseURL) else {
            throw NetworkError.invalidURL
        }
        components.queryItems = [
            URLQueryItem(name: "function", value: "TIME_SERIES_INTRADAY"),
            URLQueryItem(name: "symbol", value: ticker),
            URLQueryItem(name: "interval", value: "5min"),
            URLQueryItem(name: "apikey", value: apiKey)
        ]
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        print("Request URL: \(url.absoluteString)")
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let http = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        /// Re-throw server errors
        guard (200...299).contains(http.statusCode) else {
            throw NetworkError.serverError(statusCode: http.statusCode)
        }
        
        /// Ensure response-data is present
        guard !data.isEmpty else {
            print("Empty response for ticker: \(ticker)")
            throw NetworkError.invalidResponse
        }
        
        /// Decode the response-body into Market object
        do {
            let alphaVantageResponse = try JSONDecoder().decode(AlphaVantageResponse.self, from: data)
            let market = Market(from: alphaVantageResponse, latestOnly: true)
            print(market)
            return market
        } catch {
            // Fallback: print a small snippet to aid debugging
            if let snippet = String(data: data, encoding: .utf8)?.prefix(160) {
                print("Decoding failed for \(ticker). Snippet: \(snippet)… Error: \(error)")
            } else {
                print("Decoding failed for \(ticker). Error: \(error)")
            }
            throw NetworkError.decodingError
        }
    }

    /// Fetch market info for a specific ticker and return a Market object
    func fetchMarketSpotPrices(ticker: String) async throws -> Market {
        /// Add Query components to the URL
        guard var components = URLComponents(string: baseURL) else {
            throw NetworkError.invalidURL
        }
        components.queryItems = [
            URLQueryItem(name: "function", value: "TIME_SERIES_INTRADAY"),
            URLQueryItem(name: "symbol", value: ticker),
            URLQueryItem(name: "interval", value: "5min"),
            URLQueryItem(name: "apikey", value: apiKey)
        ]
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        print("Request URL: \(url.absoluteString)")
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let http = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        /// Re-throw server errors
        guard (200...299).contains(http.statusCode) else {
            throw NetworkError.serverError(statusCode: http.statusCode)
        }
        
        /// Ensure response-data is present
        guard !data.isEmpty else {
            print("Empty response for ticker: \(ticker)")
            throw NetworkError.invalidResponse
        }
        
        /// Decode the response-body into Market object
        do {
            let alphaVantageResponse = try JSONDecoder().decode(AlphaVantageResponse.self, from: data)
            print(alphaVantageResponse)
            return Market(from: alphaVantageResponse)
        } catch {
            // Fallback: print a small snippet to aid debugging
            if let snippet = String(data: data, encoding: .utf8)?.prefix(160) {
                print("Decoding failed for \(ticker). Snippet: \(snippet)… Error: \(error)")
            } else {
                print("Decoding failed for \(ticker). Error: \(error)")
            }
            throw NetworkError.decodingError
        }
    }
}
