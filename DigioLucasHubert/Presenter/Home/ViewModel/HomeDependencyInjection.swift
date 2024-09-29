//
//  HomeDependencyInjection.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 28/09/24.
//

import Foundation

class DependencyContainer {
    
    static let shared = DependencyContainer()
    
    private let homeRepository: HomeRepositoryProtocol

    private let getSpotlightUseCase: GetSpotlightUseCase
    private let getProductsUseCase: GetProductsUseCase
    private let getCashUseCase: GetCashUseCase
    
    private let homeViewModel: HomeViewModel
    
    private init() {

        let homeDataSource = HomeDataSourceImpl()

        homeRepository = HomeRepositoryImpl(homeDataSource: homeDataSource)

        getSpotlightUseCase = GetSpotlightUseCase(homeRepository: homeRepository)
        getProductsUseCase = GetProductsUseCase(homeRepository: homeRepository)
        getCashUseCase = GetCashUseCase(homeRepository: homeRepository)

        homeViewModel = HomeViewModel(
            getSpotlightUseCase: getSpotlightUseCase,
            getProductsUseCase: getProductsUseCase,
            getCashUseCase: getCashUseCase
        )
    }

    func provideHomeViewModel() -> HomeViewModel {
        return homeViewModel
    }
}
