//
//  HomeRemoteServiceContract.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Foundation

protocol HomeRemoteServiceContract {
    func fetchGiveWaysList(type: String) async throws -> GiveawaysListResponse
}
