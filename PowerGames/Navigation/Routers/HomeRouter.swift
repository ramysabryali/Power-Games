//
//  HomeRouter.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import Foundation

protocol HomeRouterProtocol: Router {
    func openGameDetailsView(using data: GiveawayGameData)
}

final class HomeRouter: HomeRouterProtocol {
    static let shared = HomeRouter()
    
    func openGameDetailsView(using data: GiveawayGameData) {
        navigationController?.pushViewController(HomeView().viewController, animated: true)
    }
}
