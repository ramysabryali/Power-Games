//
//  MainRouter.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import SwiftUI

final class MainRouter: Router {
    static let shared: MainRouter = .init()

    var window: UIWindow?

    func setup(using windowScene: UIWindowScene) -> UIWindow? {
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = HomeView().rootView
        window?.makeKeyAndVisible()
        return window
    }

    func reloadApplication() {
        window?.rootViewController = HomeView().rootView
    }
}
