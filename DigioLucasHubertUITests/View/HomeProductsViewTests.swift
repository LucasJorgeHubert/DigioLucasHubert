//
//  HomeProductsViewTests.swift
//  DigioLucasHubertUITests
//
//  Created by Lucas Hubert on 30/09/24.
//

import XCTest

final class HomeProductsViewUITests: XCTestCase {
    func testHomeProductsViewUI() {
        let app = XCUIApplication()
        app.launch()

        let firstProduct = app.staticTexts["XBOX"]
        XCTAssertTrue(firstProduct.exists, "The first product name should be visible")
        
        let scrollView = app.scrollViews["HomeProductsScrollView"]
        XCTAssertTrue(scrollView.exists, "Scroll view should exist")
        scrollView.swipeLeft()
    }
}
