//
//  HomeViewModel.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 27/09/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State private var toast: Toast?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HomeHeaderView(userName: "Lucas Hubert")
                    HomeSpotlightView(items: viewModel.spotlight)
                    if let cash = viewModel.cash {
                        HomeCashView(cash: cash)
                    }
                    HomeProductsView(products: viewModel.products)
                    Spacer()
                }
                .toastView(toast: $toast)
            }
        }
        .task {
            do {
                try await viewModel.getSpotlight()
                try await viewModel.getCash()
                try await viewModel.getProducts()
            } catch {
                toast = Toast(style: .error, message: "Error: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    HomeView(viewModel: DependencyContainer.shared.provideHomeViewModel())
}
