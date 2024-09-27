//
//  HomeRepositoryProtocol.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 27/09/24.
//

import Foundation

protocol HomeRepositoryProtocol {
    func getHomeData() async throws -> Result<HomeModelDTO, Error>
}
