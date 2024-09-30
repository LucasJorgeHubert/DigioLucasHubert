//
//  HomeCashViewTests.swift
//  DigioLucasHubertUITests
//
//  Created by Lucas Hubert on 30/09/24.
//

import XCTest

final class HomeCashViewTests: XCTestCase {
    func testHomeCashViewUI() {
        let app = XCUIApplication()
        app.launch()

        let firstCash = app.staticTexts["Digio"]
        XCTAssertTrue(firstCash.exists, "The first Cash name should be visible")
    }
}
