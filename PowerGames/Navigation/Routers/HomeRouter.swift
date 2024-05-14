//
//  HomeRouter.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import Foundation

protocol HomeRouterProtocol: Router {
    func openGameDetailsView(using data: GiveawayGameData, onComplete: ((_ isFavorite: Bool) -> ())?)
}

final class HomeRouter: HomeRouterProtocol {
    static let shared = HomeRouter()

    func openGameDetailsView(using data: GiveawayGameData, onComplete: ((_ isFavorite: Bool) -> ())?) {
        let viewModel = GiveawayDetailsViewModel(data: data, onComplete: onComplete)
        let view = GiveawayDetailsView(viewModel: viewModel)
        push(view: view)
    }
}
