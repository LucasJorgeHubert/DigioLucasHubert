//
//  HomeRepoitoryTests.swift
//  DigioLucasHubertTests
//
//  Created by Lucas Hubert on 29/09/24.
//

import Foundation
@testable import DigioLucasHubert
import XCTest

class HomeRepositoryMock: HomeRepositoryProtocol {
    var result: Result<HomeModelDTO, Error>?
    
    func getHomeData() async throws -> Result<HomeModelDTO, Error> {
        if let result = result {
            return result
        } else {
            throw URLError(.badServerResponse)
        }
    }
}

class HomeRepositoryTests: XCTestCase {
    var homeRepositoryMock: HomeRepositoryMock?
    
    override func setUp() {
        super.setUp()
        homeRepositoryMock = HomeRepositoryMock()
    }
    
    func testHomeRepositoryFetchSuccess() async throws {
        homeRepositoryMock?.result = .success(HomeModelDTO.MOCK)
        
        let result = try await homeRepositoryMock?.getHomeData()
        
        switch result {
        case .success(let homeModel):
            XCTAssertEqual(homeModel.spotlight.count, 3)
            XCTAssertEqual(homeModel.products.count, 2)
            XCTAssertEqual(homeModel.cash.title, "Cash 1")
        case .failure:
            XCTFail("Expected success but got failure.")
        case .none:
            XCTFail("Expected success but got failure.")
        }
    }
    
    func testHomeRepositoryFetchFailure() async throws {
        let mockError = URLError(.badServerResponse)
        homeRepositoryMock?.result = .failure(mockError)
        
        let result = try await homeRepositoryMock?.getHomeData()
        
        switch result {
        case .success:
            XCTFail("Expected failure but got success.")
        case .failure(let error):
            XCTAssertEqual((error as? URLError)?.code, .badServerResponse)
        case .none:
            XCTFail("Expected failure but got success.")
        }
    }
}
