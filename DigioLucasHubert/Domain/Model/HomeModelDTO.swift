//
//  HomeModel.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 27/09/24.
//

import Foundation

struct HomeModelDTO: Codable {
    let spotlight: [SpotlightModel]
    let products: [ProductModel]
    let cash: CashModel
}
