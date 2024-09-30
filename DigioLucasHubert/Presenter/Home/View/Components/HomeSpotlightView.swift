//
//  HomeSpotlightView.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 28/09/24.
//

import SwiftUI

struct HomeSpotlightView: View {
    let items: [SpotlightModel]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(items.indices, id: \.self) { index in
                    if let url = URL(string: items[index].bannerURL) {
                        AsyncImage(url: url) { image in
                            image.image?
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 150)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .accessibilityIdentifier("SpotlightImage_\(index)")
                        }
                        .containerRelativeFrame(.horizontal, count: 1, span: 1, spacing: 10, alignment: .leading)
                    }
                }
            }
            .scrollTargetLayout()
            .padding(.vertical)
            .accessibilityIdentifier("HomeSpotlightScrollView")
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 40)
        .scrollIndicators(.hidden)
        .frame(height: 180)
    }
}

#Preview {
    HomeSpotlightView(items: SpotlightModel.MOCK)
}
