//
//  NetworkConstants.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Foundation

enum NetworkConstants {
    enum Range {
        static let statusCode = 200...299
    }

    static let createdStatusCode = 2001
    static let retries: Int = 3
    static let baseUrl: String = "https://www.gamerpower.com" // "getBaseUrl()"

    static let timeoutIntervalForRequest: Double = 120

//    private static func getBaseUrl() -> String {
//        let scheme = EnvironmentManager.shared.string(key: .serverScheme)
//        let host = EnvironmentManager.shared.string(key: .serverHost)
//
//        return "\(scheme)://\(host)"
//    }
}
