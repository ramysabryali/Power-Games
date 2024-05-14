//
//  Array+Helpers.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import Foundation

public extension Array {
    /// Subscript to avoid out of bounds crashes
    subscript(safe index: Index) -> Element? {
        isValid(index: index) ? self[index] : nil
    }

    /// safe set element in array at index
    /// - Parameters:
    ///   - value: New elemant value
    ///   - index: array index
    mutating func safeSet(_ value: Element, at index: Int) {
        guard isValid(index: index) else { return }
        self[index] = value
    }

    /// Index is in array or out of Array
    /// - Parameter index: array index
    /// - Returns: is valid index
    func isValid(index: Int) -> Bool {
        index >= 0 && index < count
    }
}
