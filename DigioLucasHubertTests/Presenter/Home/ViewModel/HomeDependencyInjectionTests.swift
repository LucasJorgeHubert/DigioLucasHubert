//
//  HomeDependencyInjectionTests.swift
//  DigioLucasHubertTests
//
//  Created by Lucas Hubert on 29/09/24.
//

import Foundation
import XCTest
@testable import DigioLucasHubert

class DependencyContainerTests: XCTestCase {
    var dependencyContainer: DependencyContainer?

    override func setUp() {
        super.setUp()
        dependencyContainer = DependencyContainer.shared
    }

    func testSharedInstance() {
        let anotherInstance = DependencyContainer.shared
        XCTAssertTrue(dependencyContainer === anotherInstance, "Shared instance should be the same")
    }

    func testHomeViewModelInitialization() {
        let homeViewModel = dependencyContainer?.provideHomeViewModel()
        XCTAssertNotNil(homeViewModel, "HomeViewModel should not be nil")
        
        XCTAssertTrue(
            homeViewModel?.getSpotlightUseCase is GetSpotlightUseCase,
            "getSpotlightUseCase should be of type GetSpotlightUseCase"
        )
        XCTAssertTrue(
            homeViewModel?.getProductsUseCase is GetProductsUseCase,
            "getProductsUseCase should be of type GetProductsUseCase"
        )
        XCTAssertTrue(
            homeViewModel?.getCashUseCase is GetCashUseCase,
            "getCashUseCase should be of type GetCashUseCase"
        )
    }
}
