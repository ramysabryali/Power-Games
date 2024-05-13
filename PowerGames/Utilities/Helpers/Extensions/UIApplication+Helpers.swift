//
//  UIApplication+Helpers.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import SwiftUI
import UIKit

extension UIApplication {
    var keyWindow: UIWindow? {
        // Get connected scenes
        connectedScenes
            // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap { $0 as? UIWindowScene }?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }

    var topController: UIViewController? {
        guard var topController = keyWindow?.rootViewController else { return nil }

        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }

        return topController
    }

    func showAlertView(
        _ alertData: AlertItem,
        completion: @escaping () -> ()
    ) {
        guard let topController,
              !(topController is UIAlertController)
        else {
            return
        }

        let alert = UIAlertController(
            title: alertData.title?.localized,
            message: alertData.message?.localized,
            preferredStyle: alertData.style
        )
        for action in alertData.actions {
            alert.addAction(action.toUIAlertAction)
        }
        topController.present(alert, animated: true, completion: completion)
    }
}
