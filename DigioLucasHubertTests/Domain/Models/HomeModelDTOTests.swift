//
//  HomeModelDTOTests.swift
//  DigioLucasHubertTests
//
//  Created by Lucas Hubert on 29/09/24.
//

import Foundation
import XCTest
@testable import DigioLucasHubert

class HomeModelDTOTests: XCTestCase {
    func testHomeModelDTOEncodingDecoding() throws {
        let homeModel = HomeModelDTO.MOCK
        
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        
        let data = try encoder.encode(homeModel)
        
        let decodedModel = try decoder.decode(HomeModelDTO.self, from: data)
        
        XCTAssertEqual(homeModel.spotlight, decodedModel.spotlight)
        XCTAssertEqual(homeModel.products, decodedModel.products)
        XCTAssertEqual(homeModel.cash.title, decodedModel.cash.title)
    }
}
