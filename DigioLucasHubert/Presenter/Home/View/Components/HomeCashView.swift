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
            if !cash.bannerURL.isEmpty {
                AsyncImage(url: URL(string: cash.bannerURL)!) { i in
                    i.image?
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
