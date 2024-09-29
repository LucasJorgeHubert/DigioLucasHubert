//
//  CashModel.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 27/09/24.
//

import Foundation

struct CashModel: Codable {
    let title: String
    let bannerURL: String
    let description: String
    
    static let MOCK =
        CashModel(
            title: "Cash 1",
            bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png",
            description: "Agora ficou mais"
        )
}
