//
//  ProductModel.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 27/09/24.
//

import Foundation

struct ProductModel: Codable, Hashable {
    let name: String
    let imageURL: String
    let description: String
    
    static let MOCK: [ProductModel] = [
        ProductModel(
            name: "Product 1",
            imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png",
            description: "Agora ficou mais 1"
        ),
        ProductModel(
            name: "Product 2",
            imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/xbx_icon.png",
            description: "Agora ficou mais 2"
        )
    ]
}
