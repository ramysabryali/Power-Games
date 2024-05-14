//
//  UINavigationController+View.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import SwiftUI

extension View {
    var rootView: UINavigationController {
        let navigationController: UINavigationController = .init()
        navigationController.isNavigationBarHidden = true
        let rootView = presentationStyle(.push).navigationController(navigationController)
        navigationController.setViewControllers([UIHostingController(rootView: rootView)], animated: true)

        return navigationController
    }

    var viewController: UIViewController {
        UIHostingController(
            rootView: self
        )
    }

    func viewController(
        using presentationStyle: PresentationStyle,
        and navigationController: UINavigationController
    ) -> UIViewController {
        UIHostingController(
            rootView: self.presentationStyle(presentationStyle).navigationController(navigationController)
        )
    }

    func navigationController(_ value: UINavigationController) -> some View {
        environment(\.navigationController, value)
    }

    func presentationStyle(_ value: PresentationStyle) -> some View {
        environment(\.presentationStyle, value)
    }

    func eraseToViewController(_ navigation: UINavigationController) -> UIViewController {
        navigationController(navigation)
            .viewController
    }
}
