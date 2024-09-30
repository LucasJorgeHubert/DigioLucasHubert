//
//  DigioLucasHubertUITests.swift
//  DigioLucasHubertUITests
//
//  Created by Lucas Hubert on 27/09/24.
//

import XCTest

final class HomeViewUITests: XCTestCase {
    override func setUp() {
        super.setUp()
        let app = XCUIApplication()
        app.launchArguments = ["-UITesting"]
        app.launch()
    }

    func testHomeViewDisplaysCorrectContent() {
        let app = XCUIApplication()
        
        XCTAssertTrue(app.staticTexts["Olá, Lucas Hubert"].exists)
    }
    
    // swiftlint:disable:next unneeded_override
    override func tearDown() {
        super.tearDown()
    }
}
