//
//  GiveawayDetailsView.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import SwiftUI

struct GiveawayDetailsView: View {
    @ObservedObject var viewModel: GiveawayDetailsViewModel

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    buildTopHeaderViews(using: geometry)
                    detailsContentView
                }
            }
            .ignoresSafeArea()
        }
    }
}

private extension GiveawayDetailsView {
    func buildTopHeaderViews(using geometry: GeometryProxy) -> some View {
        Rectangle()
            .frame(height: geometry.size.height * 0.5)
            .overlay {
                ZStack(alignment: .top) {
                    AsyncImage(
                        url: viewModel.imageURL,
                        thumbnailURL: viewModel.thumbnailURL
                    )
                    .frame(height: geometry.size.height * 0.5)
                    .overlay {
                        Color.black.opacity(0.6)
                    }

                    VStack {
                        headerView
                        Spacer()
                        titleAndGetItViews
                    }
                    .padding(.top, geometry.safeAreaInsets.top)
                }
            }
    }

    var headerView: some View {
        HStack {
            Button(action: {
                viewModel.onPressBack()
            }, label: {
                Image("left-arrow-in-circule")
                    .resizable()
                    .frame(width: 35, height: 35)
            })

            Spacer()

            Button(action: {
                viewModel.onPressFavorite()
            }, label: {
                withAnimation {
                    Image(viewModel.isFavorite ? "heart-filled" : "heart")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
            })
        }
        .padding()
    }

    var titleAndGetItViews: some View {
        HStack {
            Text(viewModel.title)
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.leading)

            Spacer()

            Button(action: {}, label: {
                Text("Get it")
                    .foregroundColor(.black)
                    .frame(width: 60, height: 35)
                    .background(Color.white)
                    .cornerRadius(10)
            })
        }
        .padding()
    }

    var detailsContentView: some View {
        VStack(alignment: .leading, spacing: 20) {
            gameBasicInfoView
            detailedInfoView
        }
        .padding()
    }

    var gameBasicInfoView: some View {
        HStack {
            VStack {
                Image("dollar-symbol")
                    .resizable()
                    .frame(width: 38, height: 38)
                    .scaledToFit()

                Text(viewModel.price)
                    .font(.system(size: 18, weight: .bold))
            }
            Spacer()
            VStack {
                Image("users")
                    .resizable()
                    .frame(width: 38, height: 38)
                    .scaledToFit()

                Text(viewModel.users)
                    .font(.system(size: 18, weight: .bold))
            }
            Spacer()
            VStack {
                Image("games")
                    .resizable()
                    .frame(width: 38, height: 38)
                    .scaledToFit()

                Text(viewModel.type)
                    .font(.system(size: 18, weight: .bold))
            }
        }
        .padding(.horizontal)
    }

    var detailedInfoView: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Platforms")
                    .font(.system(size: 18, weight: .bold))

                Text(viewModel.platform)
                    .font(.system(size: 15))
                    .foregroundColor(Color.black.opacity(0.7))
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Giveaway End Date")
                    .font(.system(size: 18, weight: .bold))

                Text(viewModel.endDate)
                    .font(.system(size: 15))
                    .foregroundColor(Color.black.opacity(0.7))
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Description")
                    .font(.system(size: 18, weight: .bold))

                Text(viewModel.description)
                    .font(.system(size: 15))
                    .foregroundColor(Color.black.opacity(0.7))
            }
        }
    }
}

#Preview {
    GiveawayDetailsView(
        viewModel: GiveawayDetailsViewModel(
            data: GiveawayResponse.dummyData.toData
        )
    )
}
