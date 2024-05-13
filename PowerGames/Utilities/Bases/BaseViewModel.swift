//
//  BaseViewModel.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Combine

class BaseViewModel: DisposableObject {
    @Published var state: ViewModelState = .idle
    @Published var alertItem: AlertItem?
}
