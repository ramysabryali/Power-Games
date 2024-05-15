//
//  FetchGivewaysGamesUseCaseTests.swift
//  PowerGamesTests
//
//  Created by Ramy Sabry on 15/05/2024.
//

@testable import Power_Games
import XCTest

final class FetchGivewaysGamesUseCaseTests: XCTestCase {
    private var sut: FetchGivewaysGamesUseCase!

    override func setUp() {
        super.setUp()
        sut = FetchGivewaysGamesUseCase(repository: MockValidHomeRepository())
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSUT_whenFetchingGiveawaysList_successResponse() async {
        // Given
        sut = FetchGivewaysGamesUseCase(repository: MockValidHomeRepository())

        do {
            // When
            let result = try await sut.execute(platform: nil)

            // Then
            XCTAssertFalse(result.isEmpty)
        } catch {
            XCTAssertNil(error)
        }
    }

    func testSUT_whenFetchingGiveawaysList_failureResponse() async {
        // Given
        sut = FetchGivewaysGamesUseCase(repository: MockInValidHomeRepository())

        do {
            // When
            let result = try await sut.execute(platform: nil)

            // Then
            XCTAssertNil(result)
        } catch {
            XCTAssertNotNil(error)
        }
    }
    
    func testSUT_whenFetchingGiveawaysList_withPlatform_successResponse() async {
        // Given
        sut = FetchGivewaysGamesUseCase(repository: MockValidHomeRepository())

        do {
            // When
            let result = try await sut.execute(platform: "ios")

            // Then
            XCTAssertFalse(result.isEmpty)
        } catch {
            XCTAssertNil(error)
        }
    }
}
