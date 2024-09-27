//
//  GetCashUseCase.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 27/09/24.
//

import Foundation

protocol GetCashUseCaseProtocol {
    func execute() async throws -> Result<CashModel, Error>
}

struct GetCashUseCase: GetCashUseCaseProtocol {
    let homeRepository: HomeRepositoryProtocol
    
    func execute() async throws -> Result<CashModel, Error> {
        let home = try await homeRepository.getHomeData().get()
        return .success(home.cash)
    }
}
