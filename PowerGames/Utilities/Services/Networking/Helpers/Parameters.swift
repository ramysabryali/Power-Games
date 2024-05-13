//
//  Parameters.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Foundation

typealias Parameters = [String: Any]

enum RequestParams {
    case body(_: Parameters)
    case query(_: Parameters)
}
