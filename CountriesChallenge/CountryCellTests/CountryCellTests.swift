//
//  CountryCellTests.swift
//  CountriesChallengeTests
//
//  Created by Anton Kramarenko on 16.06.2023.
//

import XCTest
@testable import CountriesChallenge


class CountryCellTests: XCTestCase {
    
    var cell: CountryCell!

    
    override func setUpWithError() throws {
        super.setUp()
        cell = CountryCell(style: .default, reuseIdentifier: CountryCell.identifier)

    }

    override func tearDownWithError() throws {
        cell = nil
        super.tearDown()
    }

    
    func test_01_testCellIdentifier() {
        XCTAssertEqual(CountryCell.identifier, "CountryCell", "Incorrect cell identifier")
    }
    
    func test_02_testCellSubViews() {
        XCTAssertNotNil(cell.mainStackView, "Main stack view not initialized")
        XCTAssertNotNil(cell.firstLineStack, "First line stack view not initialized")
        XCTAssertNotNil(cell.secondLineStack, "Second line stack view not initialized")
        XCTAssertNotNil(cell.nameAndRegionLabel, "Name and region label not initialized")
        XCTAssertNotNil(cell.codeLabel, "Code label not initialized")
        XCTAssertNotNil(cell.capitalLabel, "Capital label not initialized")

        XCTAssertEqual(cell.mainStackView.axis, .vertical, "Main stack view has incorrect axis")
        XCTAssertEqual(cell.firstLineStack.axis, .horizontal, "First line stack view has incorrect axis")
        XCTAssertEqual(cell.secondLineStack.axis, .horizontal, "Second line stack view has incorrect axis")

        XCTAssertEqual(cell.nameAndRegionLabel.font, UIFont.preferredFont(forTextStyle: .body), "Incorrect font for name and region label")
        XCTAssertEqual(cell.codeLabel.font, UIFont.preferredFont(forTextStyle: .body), "Incorrect font for code label")
        XCTAssertEqual(cell.capitalLabel.font, UIFont.preferredFont(forTextStyle: .body), "Incorrect font for capital label")
    }
    
    func testCellConfigure() {
        let currency = Currency(code: "USD", name: "US Dollar", symbol: "$")
        let language = Language(code: "en", name: "English")
        let country = Country(capital: "Washington, D.C.", code: "US", currency: currency, flag: "🇺🇸", language: language, name: "United States", region: "Americas")
        cell.configure(country: country)

        XCTAssertEqual(cell.nameAndRegionLabel.text, "United States, Americas", "Incorrect text for name and region label")
        XCTAssertEqual(cell.codeLabel.text, "US", "Incorrect text for code label")
        XCTAssertEqual(cell.capitalLabel.text, "Washington, D.C.", "Incorrect text for capital label")
    }
    
    
    
}

