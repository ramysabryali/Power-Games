//
//  HeaderView.swift
//  PowerGames
//
//  Created by Ramy Sabry on 13/05/2024.
//

import SwiftUI

struct HeaderView: View {
    let userName: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("👋")

                Text("Hello, \(userName)")
                    .font(.headline)
            }

            Spacer()

            Image("boy")
                .resizable()
                .frame(width: 30, height: 30)
        }
        .padding()
    }
}

#Preview {
    HeaderView(userName: "Muhammed")
}
