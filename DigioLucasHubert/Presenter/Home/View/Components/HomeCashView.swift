//
//  HomeCashView.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 29/09/24.
//

import SwiftUI

struct HomeCashView: View {
    var cash: CashModel
    @Binding var isLoading: Bool
    
    var body: some View {
        VStack {
            HomeSessionHeader(text: "Digio Cash")
                .skeleton(with: isLoading)
                .frame(maxWidth: .infinity, maxHeight: 40)
                
            if let url = URL(string: cash.bannerURL) {
                AsyncImage(url: url) { image in
                    image.image?
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        .clipped()
                }
                .skeleton(with: isLoading)
                .frame(maxWidth: .infinity, maxHeight: 100)
                .padding(.horizontal)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    HomeCashView(
        cash: CashModel.MOCK,
        isLoading: Binding.constant(true)
    )
}
