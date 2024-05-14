//
//  GiveawaysResponse.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Foundation

typealias GiveawaysListResponse = [GiveawayResponse]

struct GiveawayResponse: Decodable {
    let id: Int
    let title: String?
    let worth: String?
    let thumbnail: URL?
    let image: URL?
    let description: String?
    let instructions: String?
    let openGiveawayURL: URL?
    let publishedDate: String?
    let platforms: String?
    let endDate: String?
    let users: Int?
    let gamerpowerURL: URL?
    let openGiveaway: URL?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id, title, worth, thumbnail, image, description, instructions
        case openGiveawayURL = "open_giveaway_url"
        case publishedDate = "published_date"
        case platforms
        case endDate = "end_date"
        case users
        case type
        case gamerpowerURL = "gamerpower_url"
        case openGiveaway = "open_giveaway"
    }
}

extension GiveawayResponse {
    var toData: GiveawayGameData {
        GiveawayGameData(
            id: UUID(),
            title: title,
            description: description,
            thumbnail: thumbnail,
            image: image,
            platforms: platforms,
            endDate: endDate,
            users: users,
            type: type,
            price: worth
        )
    }

    static var dummyData: GiveawayResponse {
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
            endDate: "N/A",
            users: 410,
            gamerpowerURL: URL(string: "https://www.gamerpower.com/wingspan-soundtrack-steam-key-giveaway"),
            openGiveaway: URL(string: "https://www.gamerpower.com/open/wingspan-soundtrack-steam-key-giveaway"),
            type: "DLC"
        )
    }
}
