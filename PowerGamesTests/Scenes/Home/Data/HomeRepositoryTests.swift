//
//  HomeRepositoryTests.swift
//  PowerGamesTests
//
//  Created by Ramy Sabry on 15/05/2024.
//

@testable import Power_Games
import XCTest

final class HomeRepositoryTests: XCTestCase {
    private var sut: HomeRepository!

    override func setUp() {
        super.setUp()
        sut = HomeRepository(service: MockValidHomeRemoteService())
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSUT_fetchingGiveawaysList_successResponse() async {
        // Given
        sut = HomeRepository(service: MockValidHomeRemoteService())

        do {
            // When
            let result = try await sut.fetchGiveWaysList(platform: nil)

            // Then
            XCTAssertFalse(result.isEmpty)
        } catch {
            XCTAssertNil(error)
        }
    }
    
    func testSUT_fetchingGiveawaysList_failureResponse() async {
        // Given
        sut = HomeRepository(service: MockInValidHomeRemoteService())

        do {
            // When
            let result = try await sut.fetchGiveWaysList(platform: nil)

            // Then
            XCTAssertNil(result)
        } catch {
            XCTAssertNotNil(error)
        }
    }
}
