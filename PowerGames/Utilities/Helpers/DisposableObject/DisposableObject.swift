//
//  DisposableObject.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Combine

class DisposableObject {
    var cancellables: Set<AnyCancellable>
    
    init() {
        cancellables = Set<AnyCancellable>()
    }
    
    deinit {
        cancellables.removeAll()
    }
}
