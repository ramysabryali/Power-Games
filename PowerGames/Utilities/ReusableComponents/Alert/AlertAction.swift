//
//  AlertAction.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import UIKit

struct AlertAction {
    typealias Action = () -> ()

    let title: String
    let style: UIAlertAction.Style
    var action: Action?

    init(
        title: String,
        style: UIAlertAction.Style = .default,
        action: Action?
    ) {
        self.title = title
        self.style = style
        self.action = action
    }
}

extension AlertAction {
    var toUIAlertAction: UIAlertAction {
        UIAlertAction(
            title: title.localized,
            style: style
        ) { _ in
            self.action?()
        }
    }
}
