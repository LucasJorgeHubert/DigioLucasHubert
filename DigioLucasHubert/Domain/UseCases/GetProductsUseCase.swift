//
//  GetProductsUseCase.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 27/09/24.
//

import Foundation

protocol GetProductsUseCaseProtocol {
    func execute() async throws -> Result<[ProductModel], Error>
}

struct GetProductsUseCase: GetProductsUseCaseProtocol {
    let homeRepository: HomeRepositoryProtocol
    
    func execute() async throws -> Result<[ProductModel], Error> {
        let home = try await homeRepository.getHomeData().get()
        return .success(home.products)
    }
}
