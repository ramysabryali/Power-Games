//
//  HomeView.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import Kingfisher
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                HeaderView(userName: "Muhammed")

                ZStack(alignment: .center) {
                    progressView
                    VStack {
                        ForEach(viewModel.games, id: \.id) { gameData in
                            GameListCell(data: gameData)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .cornerRadius(20)
                                .frame(height: geometry.size.height * 0.43)
                        }
                    }
                }
            } //: ScrollView
        } //: GeometryReader
        .onChange(of: viewModel.alertItem, perform: didSetAlert)
    }
}

private extension HomeView {
    var progressView: AnyView? {
        guard viewModel.state == .loading else { return nil }
        return ProgressView().eraseToAnyView()
    }

    func didSetAlert(_ alert: AlertItem?) {
        guard let alert else { return }
        UIApplication.shared.showAlertView(alert, completion: {
            viewModel.alertItem = nil
        })
    }
}

#Preview {
    HomeView()
}
