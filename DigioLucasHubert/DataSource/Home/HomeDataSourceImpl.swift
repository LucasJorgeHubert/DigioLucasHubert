//
//  HomeDataSource.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 27/09/24.
//

import Foundation

struct HomeDataSourceImpl: HomeDataSourceProtocol {
    func getHomeData() async throws -> Result<HomeModelDTO, Error> {
        let cache = URLCache(memoryCapacity: 512_000, diskCapacity: 10_240_000, diskPath: "HomeCache")
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.urlCache = cache
        sessionConfig.requestCachePolicy = .returnCacheDataElseLoad

        let session = URLSession(configuration: sessionConfig)
        
        guard let url = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products") else {
            throw URLError(.badURL)
        }
        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let decoder = JSONDecoder()
        let homeModel = try decoder.decode(HomeModelDTO.self, from: data)

        return .success(homeModel)
    }
}
