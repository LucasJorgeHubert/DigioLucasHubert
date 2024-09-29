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
    @Published var cash: CashModel = CashModel(title: "", bannerURL: "", description: "")
    
    private let getSpotlightUseCase: GetSpotlightUseCase
    private let getProductsUseCase: GetProductsUseCase
    private let getCashUseCase: GetCashUseCase
    
    init(getSpotlightUseCase: GetSpotlightUseCase,
         getProductsUseCase: GetProductsUseCase,
         getCashUseCase: GetCashUseCase) {
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
