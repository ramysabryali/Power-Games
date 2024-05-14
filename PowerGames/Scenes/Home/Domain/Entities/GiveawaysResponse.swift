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

    enum CodingKeys: String, CodingKey {
        case id, title, worth, thumbnail, image, description, instructions
        case openGiveawayURL = "open_giveaway_url"
        case publishedDate = "published_date"
        case platforms
        case endDate = "end_date"
        case users
        case gamerpowerURL = "gamerpower_url"
        case openGiveaway = "open_giveaway"
    }
}

extension GiveawayResponse {
    var domainData: GiveawayGameData {
        GiveawayGameData(
            id: UUID(),
            title: title,
            description: description,
            thumbnail: thumbnail,
            image: image,
            platforms: platforms
        )
    }
}
