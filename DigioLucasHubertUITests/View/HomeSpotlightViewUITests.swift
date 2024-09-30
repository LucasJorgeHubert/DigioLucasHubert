//
//  HomeSpotlightViewUITests.swift
//  DigioLucasHubertTests
//
//  Created by Lucas Hubert on 30/09/24.
//

import XCTest

final class HomeSpotlightViewUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launchArguments = ["-UITesting"]
        app.launch()
    }

    func testHomeSpotlightViewScrollViewExists() {
        XCTAssertTrue(app.scrollViews["HomeSpotlightScrollView"].exists, "The HomeSpotlight ScrollView should exist")
    }

    func testHomeSpotlightViewDisplaysItems() {
        let spotlightItem = app.images["SpotlightImage_0"]
        XCTAssertTrue(spotlightItem.exists, "The first spotlight image should be visible")

        let secondSpotlightItem = app.images["SpotlightImage_1"]
        app.scrollViews["HomeSpotlightScrollView"].swipeLeft()
        XCTAssertTrue(secondSpotlightItem.exists, "The second spotlight image should be visible after scrolling")
    }

    func testHomeSpotlightViewImageLoads() {
        let spotlightImage = app.images["SpotlightImage_0"]
        XCTAssertTrue(spotlightImage.waitForExistence(timeout: 5), "The spotlight image should load within 5 seconds")
    }

    override func tearDown() {
        app.terminate()
    }
}
