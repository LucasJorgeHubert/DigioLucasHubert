//
//  GetSpotlightUseCase.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 27/09/24.
//

import Foundation

protocol GetSpotlightUseCaseProtocol {
    func execute() async throws -> Result<[SpotlightModel], Error>
}

struct GetSpotlightUseCase: GetSpotlightUseCaseProtocol {
    let homeRepository: HomeRepositoryProtocol
    
    func execute() async throws -> Result<[SpotlightModel], Error> {
        let home = try await homeRepository.getHomeData().get()
        return .success(home.spotlight)
    }
}
