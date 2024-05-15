//
//  MockRouter.swift
//  PowerGamesTests
//
//  Created by Ramy Sabry on 15/05/2024.
//

@testable import Power_Games

final class MockRouter: HomeRouterProtocol {
    func openGameDetailsView(using data: Power_Games.GiveawayGameData, onComplete: ((Bool) -> ())?) {
        onComplete?(true)
    }
}
