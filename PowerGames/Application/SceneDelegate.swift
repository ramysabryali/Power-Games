//
//  SceneDelegate.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import SwiftUI

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    private var router = MainRouter.shared
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = router.setup(using: windowScene)
    }

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}
}
