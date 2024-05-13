//
//  String+Helpers.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(
            self,
            value: self,
            comment: ""
        )
    }

    func localizedFormat(using arguments: [CVarArg]) -> String {
        String(format: localized, arguments: arguments)
    }
}
