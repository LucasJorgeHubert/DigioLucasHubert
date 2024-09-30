//
//  GetCAshUseCaseTests.swift
//  DigioLucasHubertTests
//
//  Created by Lucas Hubert on 29/09/24.
//

import XCTest
@testable import DigioLucasHubert

class GetCashUseCaseTests: XCTestCase {
    var homeRepositoryMock: HomeRepositoryMock?
    var getCashUseCase: GetCashUseCase?
    
    override func setUp() {
        super.setUp()
        homeRepositoryMock = HomeRepositoryMock()
        getCashUseCase = GetCashUseCase(
            homeRepository: homeRepositoryMock ?? HomeRepositoryMock()
        )
    }
    
    func testExecuteReturnsCashOnSuccess() async throws {
        homeRepositoryMock?.result = .success(HomeModelDTO.MOCK)
        
        let result = try await getCashUseCase?.execute()
        
        switch result {
        case .success(let cash):
            XCTAssertEqual(cash.title, "Cash 1")
            XCTAssertEqual(cash.bannerURL, "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png")
            XCTAssertEqual(cash.description, "Agora ficou mais")
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
            _ = try await getCashUseCase?.execute()
            XCTFail("Expected failure but got success.")
        } catch {
            XCTAssertEqual((error as? URLError)?.code, .badServerResponse)
        }
    }
}
