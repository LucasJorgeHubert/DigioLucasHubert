//
//  SpotlightModel.swift
//  DigioLucasHubert
//
//  Created by Lucas Hubert on 27/09/24.
//

import Foundation

struct SpotlightModel: Codable, Hashable {
    let name: String
    let bannerURL: String
    let description: String
    
    static let MOCK: [SpotlightModel] = [
        SpotlightModel(
            name: "Banner 3",
            bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
            description: "Agora ficou mais 3"
        ),
        SpotlightModel(
            name: "Banner 1",
            bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
            description: "Agora ficou mais"
        ),
        SpotlightModel(
            name: "Banner 2",
            bannerURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
            description: "Agora ficou mais 2"
        )
    ]
}
