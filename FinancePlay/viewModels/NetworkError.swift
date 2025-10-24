//
//  NetworkError.swift
//  FinancePlay
//
//  Created by troy on 24.10.25.
//

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case serverError(statusCode: Int)
    case decodingError
}
