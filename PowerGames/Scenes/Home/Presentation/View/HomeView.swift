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
                VStack(alignment: .leading, spacing: 10) {
                    HeaderView(userName: "Muhammed")
                        .padding(.horizontal)
                    
                    Text("Explore\nGames Giveaways")
                        .font(Font.title.weight(.bold))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                    
                    carouselView
                        
                    ForEach(viewModel.games, id: \.id) { gameData in
                        GameListCell(data: gameData)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .cornerRadius(20)
                            .frame(height: geometry.size.height * 0.5)
                    }
                } //: VStack
            } //: ScrollView
        } //: GeometryReader
//        .onChange(of: viewModel.alertItem, perform: didSetAlert)
    }
}

private extension HomeView {
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
