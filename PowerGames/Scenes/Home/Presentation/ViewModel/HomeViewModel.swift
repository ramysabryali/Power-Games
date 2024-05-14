//
//  HomeViewModel.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Combine

final class HomeViewModel: BaseViewModel, ObservableObject {
    private let router: HomeRouterProtocol
    private let useCase: FetchGivewaysGamesUseCaseContract

    @Published var games: [GiveawayGameData] = []

    init(
        router: HomeRouterProtocol = HomeRouter.shared,
        useCase: FetchGivewaysGamesUseCaseContract = FetchGivewaysGamesUseCase()
    ) {
        self.router = router
        self.useCase = useCase

        super.init()
        onLoad()
    }
}

// MARK: - Input Methods

extension HomeViewModel {
    func onPressGame(data: GiveawayGameData) {
        router.openGameDetailsView(using: data)
    }
}

// MARK: - Private Methods

private extension HomeViewModel {
    func onLoad() {
        Task {
            await loadGames()
        }
    }

    @MainActor
    func loadGames() {
        Task {
            state = .loading

            do {
                games = try await useCase.execute()
                state = .successful
            } catch {
                state = .failed
                alertItem = .init(message: error.localizedDescription)
            }
        }
    }
}
