//
//  GiveawayDetailsViewModelTests.swift
//  PowerGamesTests
//
//  Created by Ramy Sabry on 15/05/2024.
//

import XCTest

import Combine
@testable import Power_Games
import XCTest

final class GiveawayDetailsViewModelTests: XCTestCase {
    private var sut: GiveawayDetailsViewModel!
    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        sut = GiveawayDetailsViewModel(
            router: MockRouter(),
            data: MockData.giveawayResponse.toData,
            onComplete: nil
        )
        cancellables = []
    }

    override func tearDown() {
        sut = nil
        cancellables = nil
        super.tearDown()
    }

    func testSUT_onLoad_imageURl_notNil() {
        // When
        sut = GiveawayDetailsViewModel(
            router: MockRouter(),
            data: MockData.giveawayResponse.toData,
            onComplete: nil
        )

        // Then
        XCTAssertNotNil(sut.imageURL)
    }

    func testSUT_onLoad_thumbnailURL_notNil() {
        // When
        sut = GiveawayDetailsViewModel(
            router: MockRouter(),
            data: MockData.giveawayResponse.toData,
            onComplete: nil
        )

        // Then
        XCTAssertNotNil(sut.thumbnailURL)
    }

    func testSUT_onLoad_titleLoadsSuccessfully() {
        // When
        sut = GiveawayDetailsViewModel(
            router: MockRouter(),
            data: MockData.giveawayResponse.toData,
            onComplete: nil
        )

        // Then
        XCTAssertFalse(sut.title.isEmpty)
    }

    func testSUT_onLoad_priceLoadsSuccessfully() {
        // When
        sut = GiveawayDetailsViewModel(
            router: MockRouter(),
            data: MockData.giveawayResponse.toData,
            onComplete: nil
        )

        // Then
        XCTAssertFalse(sut.price.isEmpty)
    }

    func testSUT_onLoad_typeLoadsSuccessfully() {
        // When
        sut = GiveawayDetailsViewModel(
            router: MockRouter(),
            data: MockData.giveawayResponse.toData,
            onComplete: nil
        )

        // Then
        XCTAssertFalse(sut.type.isEmpty)
    }

    func testSUT_onLoad_platformLoadsSuccessfully() {
        // When
        sut = GiveawayDetailsViewModel(
            router: MockRouter(),
            data: MockData.giveawayResponse.toData,
            onComplete: nil
        )

        // Then
        XCTAssertFalse(sut.platform.isEmpty)
    }

    func testSUT_onLoad_usersLoadsSuccessfully() {
        // When
        sut = GiveawayDetailsViewModel(
            router: MockRouter(),
            data: MockData.giveawayResponse.toData,
            onComplete: nil
        )

        // Then
        XCTAssertFalse(sut.users.isEmpty)
    }

    func testSUT_onLoad_descriptionLoadsSuccessfully() {
        // When
        sut = GiveawayDetailsViewModel(
            router: MockRouter(),
            data: MockData.giveawayResponse.toData,
            onComplete: nil
        )

        // Then
        XCTAssertFalse(sut.description.isEmpty)
    }

    func testSUT_onLoad_isFavoriteLoadsSuccessfully() {
        // When
        sut = GiveawayDetailsViewModel(
            router: MockRouter(),
            data: MockData.giveawayResponse.toData,
            onComplete: nil
        )

        // Then
        XCTAssertEqual(sut.isFavorite, MockData.giveawayResponse.toData.isFavorite)
    }
    
    func testSUT_onLoad_endDateLoadsSuccessfully() {
        // When
        sut = GiveawayDetailsViewModel(
            router: MockRouter(),
            data: MockData.giveawayResponse.toData,
            onComplete: nil
        )

        // Then
        XCTAssertEqual(
            sut.endDate,
            "13-05-2024"
        )
    }

    func testSUT_onPressBack_completionTriggers() {
        // Given
        var completion: ((_ isFavorite: Bool) -> ())?
        sut = GiveawayDetailsViewModel(
            router: MockRouter(),
            data: MockData.giveawayResponse.toData,
            onComplete: completion
        )

        // when
        sut.onPressBack()

        // Then
        completion = { isFavorite in
            XCTAssertEqual(
                isFavorite,
                MockData.giveawayResponse.toData.isFavorite
            )
        }
    }

    func testSUT_onPressFavorite_isFavoriteTogglesSuccessFully() {
        // Given
        sut = GiveawayDetailsViewModel(
            router: MockRouter(),
            data: MockData.giveawayResponse.toData,
            onComplete: nil
        )

        // when
        sut.onPressFavorite()

        // Then
        XCTAssertNotEqual(
            sut.isFavorite,
            MockData.giveawayResponse.toData.isFavorite
        )
    }
}
