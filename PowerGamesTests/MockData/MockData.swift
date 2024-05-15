//
//  MockData.swift
//  PowerGamesTests
//
//  Created by Ramy Sabry on 15/05/2024.
//

import Foundation
@testable import Power_Games

enum MockData {
    static var giveawayResponse: GiveawayResponse {
        GiveawayResponse(
            id: 2845,
            title: "Wingspan Soundtrack Steam Key Giveaway",
            worth: "$9.99",
            thumbnail: URL(string: "https://www.gamerpower.com/offers/1/6642dc12e7787.jpg"),
            image: URL(string: "https://www.gamerpower.com/offers/1b/6642dc12e7787.jpg"),
            description: "Claim your free Wingspan Soundtrack Steam Key and unlock the full Wingspan soundtrack composed by Paweł Górniak.",
            instructions: "1. Login into your free Alienware account and click the button to unlock your key.\r\n2. Launch the Steam client and click the Games menu option.\r\n3. Choose \"activate a Product on Steam\" to redeem your Steam key.",
            openGiveawayURL: URL(string: "https://www.gamerpower.com/open/wingspan-soundtrack-steam-key-giveaway"),
            publishedDate: "2024-05-13 23:35:46",
            platforms: "PC, Steam",
            endDate: "2024-05-13 23:35:46",
            users: 410,
            gamerpowerURL: URL(string: "https://www.gamerpower.com/wingspan-soundtrack-steam-key-giveaway"),
            openGiveaway: URL(string: "https://www.gamerpower.com/open/wingspan-soundtrack-steam-key-giveaway"),
            type: "DLC"
        )
    }
}

enum MockError: Error {
    case invalidMapping
    case unexpectedError
}
