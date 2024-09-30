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
    @State var isLoadingSpotlight = false
    @State var isLoadingCash = false
    @State var isLoadingProducts = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HomeHeaderView(
                        userName: "Lucas Hubert",
                        isLoading: $isLoadingSpotlight
                    )
                    HomeSpotlightView(
                        items: viewModel.spotlight,
                        isLoading: $isLoadingSpotlight
                    )
                    if let cash = viewModel.cash {
                        HomeCashView(
                            cash: cash,
                            isLoading: $isLoadingCash
                        )
                    }
                    HomeProductsView(
                        products: viewModel.products,
                        isLoading: $isLoadingProducts
                    )
                    Spacer()
                }
                .toastView(toast: $toast)
            }
        }
        .task {
            do {
                try await viewModel.getSpotlight()
                isLoadingSpotlight = false
                try await viewModel.getCash()
                isLoadingCash = false
                try await viewModel.getProducts()
                isLoadingProducts = false
            } catch {
                toast = Toast(style: .error, message: "Error: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    HomeView(viewModel: DependencyContainer.shared.provideHomeViewModel())
}
