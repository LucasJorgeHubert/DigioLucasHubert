//
//  ProductModelTests.swift
//  DigioLucasHubertTests
//
//  Created by Lucas Hubert on 29/09/24.
//

import Foundation
import XCTest
@testable import DigioLucasHubert

class ProductModelTests: XCTestCase {
    func testProductModelMock() {
        let productMocks = ProductModel.MOCK
        
        XCTAssertEqual(productMocks.count, 2)
        XCTAssertEqual(productMocks[0].name, "Product 1")
        XCTAssertEqual(productMocks[0].imageURL, "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png")
        XCTAssertEqual(productMocks[0].description, "Agora ficou mais 1")
    }
}
