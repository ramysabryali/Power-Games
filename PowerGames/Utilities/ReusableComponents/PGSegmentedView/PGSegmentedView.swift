//
//  PGSegmentedView.swift
//  PowerGames
//
//  Created by Ramy Sabry on 15/05/2024.
//

import SwiftUI

struct PGSegmentedView<Item: Hashable, Content: View>: View {
    let spacing: CGFloat = 15
    let items: [Item]

    @Binding var selecteditem: Item
    @ViewBuilder var content: (Item, _ isSelected: Bool) -> Content

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: spacing) {
                ForEach(items, id: \.self) { item in
                    Button(action: {
                        selecteditem = item
                    }, label: {
                        content(item, selecteditem == item)
                    })
                }
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}
