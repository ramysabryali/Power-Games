//
//  HomeCarouseCellCardView.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import SwiftUI

struct HomeCarouseCellCardView: View {
    let data: GiveawayGameData

    var body: some View {
        ZStack {
            backgroundImageView
            content
        }
    }

    private var backgroundImageView: some View {
        Rectangle()
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
            Text(data.title ?? "")
                .foregroundColor(.white)
                .font(Font.subheadline.weight(.bold))
                .multilineTextAlignment(.leading)

            Spacer()

            Text(data.description ?? "")
                .foregroundColor(.white)
                .font(.system(size: 12))
                .multilineTextAlignment(.leading)
                .opacity(0.8)
        }
        .padding()
    }
}
