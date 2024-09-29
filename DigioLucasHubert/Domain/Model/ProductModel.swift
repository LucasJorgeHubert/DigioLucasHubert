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
            description: "Com o e-Gift Card Level Up vocÃª adquire crÃ©ditos para jogar diversas opÃ§Ãµes de games, de MMORPGs a jogos de Tiro e Mobas! Para ver a lista de jogos e a quantia de crÃ©ditos que pode resgatar em cada um deles, acesse: http://levelupgames.uol.com.br/levelup/seuegiftcard.lhtml"
        ),
        ProductModel(
            name: "Product 2",
            imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/xbx_icon.png",
            description: "Agora ficou mais 2"
        )
    ]
}
