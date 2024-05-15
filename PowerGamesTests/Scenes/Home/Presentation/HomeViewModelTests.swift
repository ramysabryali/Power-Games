//
//  HomeViewModelTests.swift
//  PowerGamesTests
//
//  Created by Ramy Sabry on 15/05/2024.
//

import Combine
@testable import Power_Games
import XCTest

final class HomeViewModelTests: XCTestCase {
    private var sut: HomeViewModel!
    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        sut = HomeViewModel(
            router: MockRouter(),
            useCase: MockValidFetchGivewaysGamesUseCase()
        )
        cancellables = []
    }

    override func tearDown() {
        sut = nil
        cancellables = nil
        super.tearDown()
    }

    func testSUT_whenLoad_fetchingData_validResponse() {
        // Given
        let expectation = expectation(description: "fetching data when loading exp")

        // When
        sut = HomeViewModel(
            router: MockRouter(),
            useCase: MockValidFetchGivewaysGamesUseCase()
        )

        // Then
        sut.$games
            .dropFirst()
            .receive(on: RunLoop.main)
            .sink { data in
                XCTAssertFalse(data.isEmpty)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        waitForExpectations(timeout: 1.0)
    }

    func testSUT_whenLoad_fetchingData_failure() {
        // Given
        let expectation = expectation(description: "fetching data when loading failure")

        // When
        sut = HomeViewModel(
            router: MockRouter(),
            useCase: MockInValidFetchGivewaysGamesUseCase()
        )

        // Then
        sut.$alertItem
            .receive(on: RunLoop.main)
            .dropFirst()
            .sink { state in
                expectation.fulfill()
                XCTAssertNotNil(state)
            }
            .store(in: &cancellables)

        waitForExpectations(timeout: 1.0)
    }

    func testSUT_whenSelectingPlatform_fetchingData_validResponse() {
        // Given
        let expectation = expectation(description: "fetching data when selecting platform")
        sut = HomeViewModel(
            router: MockRouter(),
            useCase: MockValidFetchGivewaysGamesUseCase()
        )

        // When
        sut.currentPlatform = .ios

        // Then
        sut.$games
            .dropFirst()
            .receive(on: RunLoop.main)
            .sink { data in
                XCTAssertFalse(data.isEmpty)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        waitForExpectations(timeout: 1.0)
    }

    func testSUT_whenPressAddToFavorite_updateFavoriteSuccess() {
        // Given
        sut = HomeViewModel(
            router: MockRouter(),
            useCase: MockValidFetchGivewaysGamesUseCase()
        )

        // When
        sut.games = [MockData.giveawayResponse.toData]
        sut.onPressFavorite(data: MockData.giveawayResponse.toData)

        // Then
        XCTAssertNotEqual(MockData.giveawayResponse.toData.isFavorite, true)
    }

    func testSUT_whenPressOnGameItem_updateItemFavoriteOnComplete_success() {
        // Given
        sut = HomeViewModel(
            router: MockRouter(),
            useCase: MockValidFetchGivewaysGamesUseCase()
        )

        // When
        sut.games = [MockData.giveawayResponse.toData]
        sut.onPressGame(data: MockData.giveawayResponse.toData)

        // Then
        XCTAssertNotEqual(MockData.giveawayResponse.toData.isFavorite, true)
    }
}
