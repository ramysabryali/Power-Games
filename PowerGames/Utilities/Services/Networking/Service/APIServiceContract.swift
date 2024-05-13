//
//  APIServiceContract.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Foundation

protocol APIServiceContract {
    func request<T: Decodable>(
        using request: URLRequest,
        decoder: JSONDecoder,
        responseType: T.Type
    ) async throws -> T
}

extension APIServiceContract {
    func request<T: Decodable>(
        using request: URLRequest,
        responseType: T.Type = T.self
    ) async throws -> T {
        try await self.request(using: request, decoder: JSONDecoder(), responseType: responseType)
    }
}
