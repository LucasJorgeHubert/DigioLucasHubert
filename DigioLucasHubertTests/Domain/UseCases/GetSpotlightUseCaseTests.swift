//
//  HomeRepositoryMock.swift
//  DigioLucasHubertTests
//
//  Created by Lucas Hubert on 29/09/24.
//

import XCTest
@testable import DigioLucasHubert

class GetSpotlightUseCaseTests: XCTestCase {
    var homeRepositoryMock: HomeRepositoryMock?
    var getSpotlightUseCase: GetSpotlightUseCase?
    
    override func setUp() {
        super.setUp()
        homeRepositoryMock = HomeRepositoryMock()
        getSpotlightUseCase = GetSpotlightUseCase(
            homeRepository: homeRepositoryMock ?? HomeRepositoryMock()
        )
    }
    
    func testExecuteReturnsSpotlightOnSuccess() async throws {
        homeRepositoryMock?.result = .success(HomeModelDTO.MOCK)
        
        let result = try await getSpotlightUseCase?.execute()
        
        switch result {
        case .success(let spotlight):
            XCTAssertEqual(spotlight.count, 3)
            XCTAssertEqual(spotlight[0].name, "Banner 3")
        case .failure:
            XCTFail("Expected success but got failure.")
        case .none:
            XCTFail("Expected success but got failure.")
        }
    }
    
    func testExecuteReturnsErrorOnFailure() async throws {
        let mockError = URLError(.badServerResponse)
        homeRepositoryMock?.result = .failure(mockError)
        
        do {
            _ = try await getSpotlightUseCase?.execute()
            XCTFail("Expected failure but got success.")
        } catch {
            XCTAssertEqual((error as? URLError)?.code, .badServerResponse)
        }
    }
}
