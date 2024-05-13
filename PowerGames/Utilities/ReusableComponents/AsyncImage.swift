//
//  AsyncImage.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import Kingfisher
import SwiftUI

struct AsyncImage: View {
    let url: URL?
    let thumbnailURL: URL?

    var body: some View {
        KFImage(url)
            .placeholder {
                KFImage(thumbnailURL)
            }
            .resizable()
    }
}

#Preview {
    AsyncImage(
        url: URL(string: "https://www.gamerpower.com/offers/1/65fdbef9c9153.jpg"),
        thumbnailURL: URL(string: "https://www.gamerpower.com/offers/1/65fdbef9c9153.jpg")
    )
}
