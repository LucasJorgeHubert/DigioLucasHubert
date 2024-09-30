//
//  HomeViewModelTests.swift
//  DigioLucasHubertTests
//
//  Created by Lucas Hubert on 29/09/24.
//

import Foundation
import XCTest
import Combine
@testable import DigioLucasHubert

class MockGetSpotlightUseCase: GetSpotlightUseCaseProtocol {
    var result: Result<[SpotlightModel], Error>?
    
    func execute() async -> Result<[SpotlightModel], Error> {
        return result ?? .failure(NSError(domain: "TestError", code: 1, userInfo: nil))
    }
}

class MockGetProductsUseCase: GetProductsUseCaseProtocol {
    var result: Result<[ProductModel], Error>?
    
    func execute() async -> Result<[ProductModel], Error> {
        return result ?? .failure(NSError(domain: "TestError", code: 1, userInfo: nil))
    }
}

class MockGetCashUseCase: GetCashUseCaseProtocol {
    var result: Result<CashModel, Error>?
    
    func execute() async -> Result<CashModel, Error> {
        return result ?? .failure(NSError(domain: "TestError", code: 1, userInfo: nil))
    }
}

final class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel?
    var mockGetSpotlightUseCase: MockGetSpotlightUseCase?
    var mockGetProductsUseCase: MockGetProductsUseCase?
    var mockGetCashUseCase: MockGetCashUseCase?
    var cancellables: Set<AnyCancellable> = []

    override func setUp() {
        super.setUp()
        mockGetSpotlightUseCase = MockGetSpotlightUseCase()
        mockGetProductsUseCase = MockGetProductsUseCase()
        mockGetCashUseCase = MockGetCashUseCase()
        viewModel = HomeViewModel(
            getSpotlightUseCase: mockGetSpotlightUseCase ?? MockGetSpotlightUseCase(),
            getProductsUseCase: mockGetProductsUseCase ?? MockGetProductsUseCase(),
            getCashUseCase: mockGetCashUseCase ?? MockGetCashUseCase()
        )
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        mockGetSpotlightUseCase = nil
        mockGetProductsUseCase = nil
        mockGetCashUseCase = nil
        super.tearDown()
    }

    func testGetSpotlightSuccess() async {
        let expectedSpotlight = SpotlightModel.MOCK
        mockGetSpotlightUseCase?.result = .success(expectedSpotlight)
        
        let expectation = XCTestExpectation(description: "Spotlight should be updated")
        
        viewModel?.$spotlight
            .dropFirst()
            .sink { spotlight in
                XCTAssertEqual(spotlight, expectedSpotlight)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        try? await viewModel?.getSpotlight()
        
        await fulfillment(of: [expectation], timeout: 1)
    }

    func testGetSpotlightFailure() async {
        mockGetSpotlightUseCase?.result = .failure(NSError(domain: "TestError", code: 1, userInfo: nil))
        
        try? await viewModel?.getSpotlight()
        
        XCTAssertTrue(((viewModel?.spotlight.isEmpty) != nil))
    }

    func testGetProductsSuccess() async {
        let expectedProducts = ProductModel.MOCK
        mockGetProductsUseCase?.result = .success(expectedProducts)
        
        let expectation = XCTestExpectation(description: "Products should be updated")
        
        viewModel?.$products
            .dropFirst()
            .sink { products in
                XCTAssertEqual(products, expectedProducts)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        try? await viewModel?.getProducts()
        
        await fulfillment(of: [expectation], timeout: 1)
    }

    func testGetProductsFailure() async {
        mockGetProductsUseCase?.result = .failure(NSError(domain: "TestError", code: 1, userInfo: nil))
        
        try? await viewModel?.getProducts()
        
        XCTAssertTrue(((viewModel?.products.isEmpty) != nil))
    }

    func testGetCashSuccess() async {
        let expectedCash = CashModel.MOCK
        mockGetCashUseCase?.result = .success(expectedCash)
        
        let expectation = XCTestExpectation(description: "Cash should be updated")
        
        viewModel?.$cash
            .dropFirst()
            .sink { cash in
                XCTAssertEqual(cash, expectedCash)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        try? await viewModel?.getCash()
        
        await fulfillment(of: [expectation], timeout: 1)
    }

    func testGetCashFailure() async {
        mockGetCashUseCase?.result = .failure(NSError(domain: "TestError", code: 1, userInfo: nil))
        
        try? await viewModel?.getCash()
        
        XCTAssertNil(viewModel?.cash)
    }
}
