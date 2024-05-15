//
//  MockValidAPIService.swift
//  PowerGamesTests
//
//  Created by Ramy Sabry on 15/05/2024.
//

import Foundation
@testable import Power_Games

final class MockValidAPIService: APIServiceContract {
    private let fileName: String

    init(fileName: String) {
        self.fileName = fileName
    }

    func request<T>(
        using request: URLRequest,
        decoder: JSONDecoder,
        responseType: T.Type
    ) async throws -> T where T: Decodable {
        let testBundle = Bundle(for: MockValidAPIService.self)
        guard let path = testBundle.path(forResource: fileName, ofType: "json") else {
            fatalError("\n\nplease add \(fileName).json")
        }
        let fileURL = URL(fileURLWithPath: path)

        let data = try Data(contentsOf: fileURL)
        let response = try decoder.decode(T.self, from: data)
        return response
    }
}

final class MockInValidAPIService: APIServiceContract {
    func request<T>(
        using request: URLRequest,
        decoder: JSONDecoder,
        responseType: T.Type
    ) async throws -> T where T: Decodable {
        throw MockError.unexpectedError
    }
}
