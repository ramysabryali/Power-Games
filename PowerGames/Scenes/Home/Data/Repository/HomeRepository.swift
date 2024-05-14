//
//  HomeRepository.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Foundation

final class HomeRepository {
    private let service: HomeRemoteServiceContract

    init(service: HomeRemoteServiceContract = HomeRemoteService()) {
        self.service = service
    }
}

extension HomeRepository: HomeRepositoryContract {
    func fetchGiveWaysList(type: String) async throws -> GiveawaysListResponse {
        try await service.fetchGiveWaysList(type: type)
    }
}
