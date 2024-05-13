//
//  APIService.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Foundation

final class APIService {
    static let shared = APIService()

    private init() {}

    private lazy var session: URLSession = {
        let session = URLSession(configuration: .default)
        return session
    }()
}

// MARK: - APIServiceContract

extension APIService: APIServiceContract {
    func request<T: Decodable>(
        using request: URLRequest,
        decoder: JSONDecoder,
        responseType: T.Type
    ) async throws -> T {
        let (data, _) = try await session.data(for: request)
        return try decoder.decode(responseType, from: data)
    }
}
