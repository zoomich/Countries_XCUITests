//
//  BaseTest.swift
//  CountriesChallengeUITests
//
//  Created by Anton Kramarenko on 16.06.2023.
//

import XCTest

class BaseTest: XCTestCase {
    
    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
        super.tearDown()
    }
}
