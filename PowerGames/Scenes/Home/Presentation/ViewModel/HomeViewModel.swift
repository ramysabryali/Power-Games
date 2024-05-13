//
//  HomeViewModel.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Combine

final class HomeViewModel: BaseViewModel, ObservableObject {
    private let useCase: FetchGivewaysGamesUseCaseContract

    @Published var games: [GiveawayGameData] = []

    init(useCase: FetchGivewaysGamesUseCaseContract = FetchGivewaysGamesUseCase()) {
        self.useCase = useCase

        super.init()
        onLoad()
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
            do {
                games = try await useCase.execute()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
