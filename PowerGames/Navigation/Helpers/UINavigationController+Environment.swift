//
//  UINavigationController+Environment.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import SwiftUI

// MARK: - Environment

enum NavigationControllerKey: EnvironmentKey {
    static var defaultValue: UINavigationController {
        UINavigationController()
    }
}

extension EnvironmentValues {
    var navigationController: UINavigationController {
        get { self[NavigationControllerKey.self] }
        set { self[NavigationControllerKey.self] = newValue }
    }
}

enum PresentationStyleKey: EnvironmentKey {
    static var defaultValue: PresentationStyle = .push
}

extension EnvironmentValues {
    var presentationStyle: PresentationStyle {
        get { self[PresentationStyleKey.self] }
        set { self[PresentationStyleKey.self] = newValue }
    }
}
