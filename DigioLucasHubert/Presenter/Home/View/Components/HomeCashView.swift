//
//  HomeCashView.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 29/09/24.
//

import SwiftUI

struct HomeCashView: View {
    var cash: CashModel
    
    var body: some View {
        VStack {
            HomeSessionHeader(text: "Digio Cash")
            if let url = URL(string: cash.bannerURL) {
                AsyncImage(url: url) { image in
                    image.image?
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .clipped()
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    HomeCashView(cash: CashModel.MOCK)
}
