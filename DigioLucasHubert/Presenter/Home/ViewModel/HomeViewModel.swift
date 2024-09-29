//
//  HomeViewModel.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 27/09/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var spotlight: [SpotlightModel] = []
    @Published var products: [ProductModel] = []
    @Published var cash: CashModel?
    
    private let getSpotlightUseCase: GetSpotlightUseCaseProtocol
    private let getProductsUseCase: GetProductsUseCaseProtocol
    private let getCashUseCase: GetCashUseCaseProtocol
    
    init(
        getSpotlightUseCase: GetSpotlightUseCaseProtocol,
        getProductsUseCase: GetProductsUseCaseProtocol,
        getCashUseCase: GetCashUseCaseProtocol
    ) {
        self.getSpotlightUseCase = getSpotlightUseCase
        self.getProductsUseCase = getProductsUseCase
        self.getCashUseCase = getCashUseCase
    }
    
    func getSpotlight() async throws {
        let spotlight = try await getSpotlightUseCase.execute().get()
        await MainActor.run {
            self.spotlight = spotlight
        }
    }
    
    func getProducts() async throws {
        let products = try await getProductsUseCase.execute().get()
        await MainActor.run {
            self.products = products
        }
    }
    
    func getCash() async throws {
        let cash = try await getCashUseCase.execute().get()
        await MainActor.run {
            self.cash = cash
        }
    }
}
