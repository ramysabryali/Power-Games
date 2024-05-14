//
//  UINavigationController+Helpers.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import SwiftUI

typealias PresentationEnvironment = _EnvironmentKeyWritingModifier<PresentationStyle>
typealias NavigationEnvironment = _EnvironmentKeyWritingModifier<UINavigationController>

// MARK: - General

extension UINavigationController {
    func hasView(_ view: some View) -> Bool {
        viewControllers.contains(view.viewController(using: .push, and: self))
    }
}

// MARK: - Push

extension UINavigationController {
    func pushToView(_ view: some View, animated: Bool = true) {
        pushViewController(
            view.viewController(using: .push, and: self),
            animated: animated
        )
    }

    func push(_ destination: some View, on source: some View) {
        let sourceViewController = source.viewController(using: .push, and: self)
        viewControllers.append(sourceViewController)
        pushToView(destination)
    }
}

// MARK: - Present

extension UINavigationController {
    func presentView(
        _ view: some View,
        animated: Bool = true,
        withNavigation: Bool = true,
        modalStyle: UIModalPresentationStyle = .fullScreen,
        transitionStyle: UIModalTransitionStyle = .coverVertical,
        completion: (() -> ())? = nil
    ) {
        guard withNavigation else {
            let viewController = view.viewController(using: .present, and: self)
            viewController.modalPresentationStyle = modalStyle
            viewController.modalTransitionStyle = transitionStyle

            present(
                viewController,
                animated: animated,
                completion: completion
            )
            return
        }

        let navigationController = UINavigationController()
        navigationController.setViewControllers([
            view.viewController(using: .present, and: navigationController)
        ], animated: true)
        navigationController.modalPresentationStyle = modalStyle
        navigationController.modalTransitionStyle = transitionStyle

        present(
            navigationController,
            animated: animated,
            completion: completion
        )
    }
}

// MARK: - Dismissing

extension UINavigationController {
    func pop(animated: Bool = true) {
        popViewController(animated: animated)
    }

    func popToRoot(animated: Bool = true) {
        popToRootViewController(animated: animated)
    }

    func popTo(view: some View, animated: Bool = true) {
        guard let viewController = getViewController(for: view) else { return }
        popToViewController(viewController, animated: animated)
    }

    func popTo(index: Int, animated: Bool = true) {
        guard let viewController = viewControllers[safe: index] else { return }
        popToViewController(viewController, animated: animated)
    }

    func dismissView(animated: Bool = true, completion: (() -> ())? = nil) {
        dismiss(animated: animated, completion: completion)
    }
}

// MARK: - Replace

extension UINavigationController {
    func replace(_ destination: some View, on source: some View) {
        replaceViews([destination.viewController(using: .push, and: self)], on: source)
    }

    func replaceViews(_ views: [UIViewController]) {
        viewControllers = views
    }

    func replaceViews(_ views: [UIViewController], on view: some View) {
        guard let index = getViewControllerIndex(for: view),
              index + 1 < viewControllers.count - 1
        else {
            return
        }

        viewControllers.removeSubrange(index + 1...viewControllers.count - 1)
        viewControllers.append(contentsOf: views)
    }
}

extension UINavigationController {
    func getViewController<Content: View>(for view: Content) -> UIViewController? {
        viewControllers.first(where: {
            $0 is UIHostingController<ModifiedContent<ModifiedContent<Content, PresentationEnvironment>, NavigationEnvironment>>
        })
    }

    func getViewControllerIndex<Content: View>(for view: Content) -> Int? {
        viewControllers.firstIndex(where: {
            $0 is UIHostingController<ModifiedContent<ModifiedContent<Content, PresentationEnvironment>, NavigationEnvironment>>
        })
    }
}
