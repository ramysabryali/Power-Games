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
                VStack(alignment: .center, spacing: 10) {
                    HeaderView(userName: "Muhammed")
                        .padding(.horizontal)

                    titleView
                    progressView
                    carouselView
                    buildGamesList(using: geometry)
                } //: VStack
            } //: ScrollView
        } //: GeometryReader
//        .onChange(of: viewModel.alertItem, perform: didSetAlert)
    }
}

// MARK: - Private Properties

private extension HomeView {
    var titleView: some View {
        HStack {
            Text("Explore\nGames Giveaways")
                .frame(alignment: .leading)
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            
            Spacer()
        }
    }

    var progressView: AnyView? {
        guard viewModel.state == .loading else { return nil }
        return ProgressView().eraseToAnyView()
    }

    var carouselView: some View {
        GeometryReader { geometry in
            CarouselView(
                spacing: 0,
                showsIndicator: .hidden,
                data: $viewModel.games
            ) { $item, isCentered in
                RoundedRectangle(cornerRadius: 15)
                    .overlay(
                        HomeCarouseCellCardView(data: item)
                            .frame(width: geometry.size.width * 0.7, height: 180)
                            .cornerRadius(15)
                    )
                    .background(Color.white)
                    .frame(width: geometry.size.width * 0.7)
                    .opacity(isCentered ? 1 : 0.3)
            }
            .safeAreaPadding([.horizontal], geometry.size.width * 0.13)
        }
        .frame(height: 180)
    }
}

// MARK: - Private Methods

private extension HomeView {
    @ViewBuilder
    func buildGamesList(using geometry: GeometryProxy) -> some View {
        ForEach(viewModel.games, id: \.id) { gameData in
            GameListCell(data: gameData)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .cornerRadius(20)
                .frame(height: geometry.size.height * 0.5)
        }
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
