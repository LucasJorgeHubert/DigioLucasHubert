//
//  HomeDataSourceProtocol.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 27/09/24.
//

import Foundation

protocol HomeDataSourceProtocol {
    func getHomeData() async throws -> Result<HomeModelDTO, Error>
}
