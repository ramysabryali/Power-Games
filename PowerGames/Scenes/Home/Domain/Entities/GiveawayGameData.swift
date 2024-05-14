//
//  GiveawayGameData.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import Foundation

struct GiveawayGameData: Identifiable {
    let id: UUID
    let title: String?
    let description: String?
    let thumbnail: URL?
    let image: URL?
    let platforms: String?
    let endDate: String?
    let users: Int?
    let type: String?
    let price: String?
    var isFavorite: Bool = false
}
