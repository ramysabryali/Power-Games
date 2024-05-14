//
//  HomeRepositoryContract.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Foundation

protocol HomeRepositoryContract {
    func fetchGiveWaysList(type: String) async throws -> GiveawaysListResponse
}
