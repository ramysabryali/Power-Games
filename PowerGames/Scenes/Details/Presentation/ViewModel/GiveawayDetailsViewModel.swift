//
//  GiveawayDetailsViewModel.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import Foundation

final class GiveawayDetailsViewModel: BaseViewModel, ObservableObject {
    private let router: HomeRouterProtocol
    private var onComplete: ((_ isFavorite: Bool) -> ())?

    @Published private var data: GiveawayGameData

    init(
        router: HomeRouterProtocol = HomeRouter.shared,
        data: GiveawayGameData,
        onComplete: ((_ isFavorite: Bool) -> ())?
    ) {
        self.router = router
        self.data = data
        self.onComplete = onComplete
    }
}

// MARK: - Output Properties

extension GiveawayDetailsViewModel {
    var imageURL: URL? {
        data.image
    }

    var thumbnailURL: URL? {
        data.thumbnail
    }

    var title: String {
        data.title ?? ""
    }

    var price: String {
        data.price ?? "N/A"
    }

    var type: String {
        data.type ?? "N/A"
    }

    var platform: String {
        data.platforms ?? "N/A"
    }

    var users: String {
        guard let users = data.users else { return "N/A" }
        return "\(users)"
    }

    var endDate: String {
        guard let endDate = data.endDate else { return "N/A" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        guard let date = dateFormatter.date(from: endDate) else { return "N/A" }
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: date)
    }

    var description: String {
        data.description ?? "N/A"
    }

    var isFavorite: Bool {
        data.isFavorite
    }
}

// MARK: - Input Methods

extension GiveawayDetailsViewModel {
    func onPressBack() {
        onComplete?(isFavorite)
        router.pop(animated: true)
    }

    func onPressFavorite() {
        data.isFavorite.toggle()
    }
}
