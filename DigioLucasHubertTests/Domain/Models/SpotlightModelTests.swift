//
//  SpotlightModelMockTests.swift
//  DigioLucasHubertTests
//
//  Created by Lucas Hubert on 29/09/24.
//

import XCTest
@testable import DigioLucasHubert

final class SpotlightModelMockTests: XCTestCase {
    func testSpotlightModelMock() {
        let spotlightMocks = SpotlightModel.MOCK
        
        XCTAssertEqual(spotlightMocks.count, 3)
        XCTAssertEqual(spotlightMocks[0].name, "Banner 3")
        XCTAssertEqual(
            spotlightMocks[0].bannerURL,
            "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png"
        )
        XCTAssertEqual(spotlightMocks[0].description, "Agora ficou mais 3")
    }
}
