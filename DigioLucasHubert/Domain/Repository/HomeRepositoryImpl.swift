//
//  HomeRepository.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 27/09/24.
//

import Foundation

struct HomeRepositoryImpl: HomeRepositoryProtocol {
    let homeDataSource: HomeDataSourceImpl
    
    func getHomeData() async throws -> Result<HomeModelDTO, Error> {
        return try await homeDataSource.getHomeData()
    }
}
