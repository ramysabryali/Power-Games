//
//  GameListCell.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import SwiftUI

struct GameListCell: View {
    let data: GiveawayGameData
    let onPressFavorite: () -> ()

    var body: some View {
        ZStack {
            backgroundImageView
            content
        }
    }

    private var backgroundImageView: some View {
        Rectangle()
            .foregroundColor(.white)
            .overlay {
                AsyncImage(
                    url: data.image,
                    thumbnailURL: data.thumbnail
                )
                .overlay(Color.black.opacity(0.6))
                .cornerRadius(20)
            }
    }

    private var content: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 5) {
                titleAndPlatformView
                Spacer()
                favoriteButtonView
            }
            Spacer()
            Text(data.description ?? "")
                .foregroundColor(.white)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .opacity(0.8)
        }
        .padding()
    }

    private var titleAndPlatformView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(data.title ?? "")
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .bold))
                .multilineTextAlignment(.leading)

            Text(data.platforms ?? "")
                .foregroundColor(.white)
                .font(.system(size: 14))
                .multilineTextAlignment(.leading)
                .opacity(0.6)
        }
    }

    private var favoriteButtonView: some View {
        Button(action: {
            onPressFavorite()
        }, label: {
            withAnimation {
                Image(data.isFavorite ? "heart-filled" : "heart")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
        })
    }
}
