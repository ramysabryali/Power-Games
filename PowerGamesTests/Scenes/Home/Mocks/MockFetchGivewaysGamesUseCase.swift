//
//  MockFetchGivewaysGamesUseCase.swift
//  PowerGamesTests
//
//  Created by Ramy Sabry on 15/05/2024.
//

@testable import Power_Games

final class MockValidFetchGivewaysGamesUseCase: FetchGivewaysGamesUseCaseContract {
    func execute(platform: String?) async throws -> [GiveawayGameData] {
        [MockData.giveawayResponse.toData]
    }
}

final class MockInValidFetchGivewaysGamesUseCase: FetchGivewaysGamesUseCaseContract {
    func execute(platform: String?) async throws -> [GiveawayGameData] {
        throw MockError.unexpectedError
    }
}
