//
//  FetchGivewaysGamesUseCaseContract.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Foundation

protocol FetchGivewaysGamesUseCaseContract {
    func execute(type: String) async throws -> [GiveawayGameData]
}
