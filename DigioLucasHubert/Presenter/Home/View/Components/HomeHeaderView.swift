//
//  HomeHeaderView.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 29/09/24.
//

import SwiftUI
import SkeletonUI

struct HomeHeaderView: View {
    var userName: String
    @Binding var isLoading: Bool
    
    var body: some View {
        HStack {
            Text("Olá, \(userName)")
                .fontWeight(.bold)
                .font(.title2)
                .skeleton(with: isLoading)
            
            Spacer()
            
            Image("Logotipo_Banco_Digio")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 24)
                .accessibilityIdentifier("HeaderImageView")
                .skeleton(with: isLoading)
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .padding()
    }
}

#Preview {
    HomeHeaderView(
        userName: "Lucas",
        isLoading: Binding.constant(false)
    )
}
