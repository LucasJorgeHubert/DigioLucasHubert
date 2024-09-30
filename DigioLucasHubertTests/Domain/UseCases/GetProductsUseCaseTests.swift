//
//  GetProductsUseCaseTests.swift
//  DigioLucasHubertTests
//
//  Created by Lucas Hubert on 29/09/24.
//
import XCTest
@testable import DigioLucasHubert

class GetProductsUseCaseTests: XCTestCase {
    var homeRepositoryMock: HomeRepositoryMock?
    var getProductsUseCase: GetProductsUseCase?
    
    override func setUp() {
        super.setUp()
        homeRepositoryMock = HomeRepositoryMock()
        getProductsUseCase = GetProductsUseCase(
            homeRepository: homeRepositoryMock ?? HomeRepositoryMock()
        )
    }
    
    func testExecuteReturnsProductsOnSuccess() async throws {
        homeRepositoryMock?.result = .success(HomeModelDTO.MOCK)
        
        let result = try await getProductsUseCase?.execute()
        
        switch result {
        case .success(let products):
            XCTAssertEqual(products.count, 2)
            XCTAssertEqual(products[0].name, "Product 1")
            XCTAssertEqual(products[0].imageURL, "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png")
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
            _ = try await getProductsUseCase?.execute()
            XCTFail("Expected failure but got success.")
        } catch {
            XCTAssertEqual((error as? URLError)?.code, .badServerResponse)
        }
    }
}
