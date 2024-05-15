//
//  MockHomeRemoteService.swift
//  PowerGamesTests
//
//  Created by Ramy Sabry on 15/05/2024.
//

@testable import Power_Games

final class MockValidHomeRemoteService: HomeRemoteServiceContract {
    func fetchGiveWaysList(platform: String?) async throws -> GiveawaysListResponse {
        [MockData.giveawayResponse]
    }
}

final class MockInValidHomeRemoteService: HomeRemoteServiceContract {
    func fetchGiveWaysList(platform: String?) async throws -> GiveawaysListResponse {
        throw MockError.unexpectedError
    }
}
