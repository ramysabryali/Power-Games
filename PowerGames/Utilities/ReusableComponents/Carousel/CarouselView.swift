//
//  CarouselView.swift
//  PowerGames
//
//  Created by Ramy Sabry on 14/05/2024.
//

import SwiftUI

struct CarouselView<Content: View, Item: RandomAccessCollection>: View where Item: MutableCollection,
    Item.Element: Identifiable {
    var showsIndicator: ScrollIndicatorVisibility = .hidden
    var spacing: CGFloat

    @Binding var data: Item
    @ViewBuilder var content: (Binding<Item.Element>, _ isCeentered: Bool) -> Content
    @State private var activeID: UUID?

    init(
        spacing: CGFloat = 0,
        showsIndicator: ScrollIndicatorVisibility = .hidden,
        data: Binding<Item>,
        @ViewBuilder content: @escaping (Binding<Item.Element>, _ isCeentered: Bool) -> Content
    ) {
        self.spacing = spacing
        self._data = data
        self.content = content
        self._activeID = State(initialValue: data.first?.id as? UUID)
    }

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: spacing) {
                ForEach($data) { item in
                    let isCentered = (item.id as? UUID == activeID)

                    content(item, isCentered)
                        .containerRelativeFrame(.horizontal)
                        .scaleEffect(isCentered ? 1 : 0.9)
                        .rotation3DEffect(
                            Angle(degrees: isCentered ? 0 : 45),
                            axis: (x: 0.5, y: 0.0, z: 0.0),
                            anchor: .center
                        )
                        .animation(
                            Animation.easeInOut(duration: 0.3),
                            value: UUID()
                        )
                }
            }
            .scrollTargetLayout()
        }
        .scrollIndicators(showsIndicator)
        .scrollTargetBehavior(.viewAligned)
        .scrollPosition(id: $activeID)
    }
}
