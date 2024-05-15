//
//  HomeRemoteServiceTests.swift
//  PowerGamesTests
//
//  Created by Ramy Sabry on 15/05/2024.
//

@testable import Power_Games
import XCTest

final class HomeRemoteServiceTests: XCTestCase {
    private var sut: HomeRemoteService!

    override func setUp() {
        super.setUp()
        sut = HomeRemoteService(
            apiService: MockValidAPIService(
                fileName: "giveaways-list-valid-response"
            )
        )
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSUT_fetchValidNormalGiveWaysList_successResponse() async {
        // Given
        sut = HomeRemoteService(
            apiService: MockValidAPIService(
                fileName: "giveaways-list-valid-response"
            )
        )

        do {
            // When
            let result = try await sut.fetchGiveWaysList(platform: nil)

            // Then
            XCTAssertFalse(result.isEmpty)
        } catch {
            XCTAssertNil(error)
        }
    }
    
    func testSUT_fetchValidNormalGiveWaysList_failureResponse() async {
        // Given
        sut = HomeRemoteService(
            apiService: MockInValidAPIService()
        )

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
