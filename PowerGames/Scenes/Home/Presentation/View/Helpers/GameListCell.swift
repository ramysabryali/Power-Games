//
//  GameListCell.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import SwiftUI

struct GameListCell: View {
    let data: GiveawayGameData

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
            VStack(alignment: .leading, spacing: 10) {
                Text(data.title ?? "")
                    .foregroundColor(.white)
                    .font(.title2)
                    .multilineTextAlignment(.leading)

                Text(data.platforms ?? "")
                    .foregroundColor(.white)
                    .font(.system(size: 10))
                    .multilineTextAlignment(.leading)
                    .opacity(0.6)
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
}
