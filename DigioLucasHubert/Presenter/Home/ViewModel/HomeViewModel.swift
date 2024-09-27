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
    
}
