//
//  CashModelTests.swift
//  DigioLucasHubertTests
//
//  Created by Lucas Hubert on 29/09/24.
//

import XCTest
@testable import DigioLucasHubert

final class CashModelTests: XCTestCase {
    func testCashModelMock() {
        let cashMock = CashModel.MOCK
        
        XCTAssertEqual(cashMock.title, "Cash 1")
        XCTAssertEqual(cashMock.bannerURL, "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png")
        XCTAssertEqual(cashMock.description, "Agora ficou mais")
    }
}
