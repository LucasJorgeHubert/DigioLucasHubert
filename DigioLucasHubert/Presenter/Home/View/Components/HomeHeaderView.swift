//
//  HomeHeaderView.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 29/09/24.
//

import SwiftUI

struct HomeHeaderView: View {
    
    var userName: String
    
    var body: some View {
        HStack {
            Text("Olá, \(userName)")
                .fontWeight(.bold)
                .font(.title2)
            
            Spacer()
            
            Image("Logotipo_Banco_Digio")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 24)
        }
        .padding()
    }
}

#Preview {
    HomeHeaderView(userName: "Lucas")
}
