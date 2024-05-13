//
//  RemoteService.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Foundation

final class HomeRemoteService {
    private var apiService: APIServiceContract

    init(apiService: APIServiceContract = APIService.shared) {
        self.apiService = apiService
    }
}

extension HomeRemoteService: HomeRemoteServiceContract {
    func fetchGiveWaysList() async throws -> GiveawaysListResponse {
        let request = APIBuilder()
            .setPath(using: .giveawaysList)
            .setMethod(using: .get)
            .build()

        return try await apiService.request(
            using: request,
            responseType: GiveawaysListResponse.self
        )
    }
}
