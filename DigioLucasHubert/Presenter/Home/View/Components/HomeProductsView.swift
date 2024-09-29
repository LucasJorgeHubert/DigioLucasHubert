//
//  HomeProductsView.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 29/09/24.
//

import SwiftUI

struct HomeProductsView: View {
    var products: [ProductModel]
    var body: some View {
        VStack(spacing: 0) {
            HomeSessionHeader(text: "Produtos")
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(products, id: \.self) { product in
                        VStack {
                            AsyncImage(url: URL(string: product.imageURL)!) { image in
                                image.image?
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                            }
                            .frame(width: 100, height: 100)
                            .padding(.vertical)
                            
                            Text(product.name)
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 8)
                            
                            Text(product.description)
                                .font(.footnote)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                .padding(.horizontal, 8)
                                .lineLimit(3)
                        }
                        .padding(8)
                        .frame(width: 180, height: 250)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeProductsView(products: ProductModel.MOCK)
}
