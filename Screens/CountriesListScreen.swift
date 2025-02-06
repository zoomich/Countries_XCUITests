//
//  CountriesListScreen.swift
//  CountriesChallengeUITests
//
//  Created by Anton Kramarenko on 15.06.2023.
//

import XCTest

class CountriesListScreen: BaseElement {
    private lazy var searchBar: TextView = element.searchFields.firstMatch
        .build(description: "\(description).SearchBar", timeout: timeout)
    private lazy var countriesCells: Cell = element.cells.firstMatch
        .build(description: "\(description).CountriesCells", timeout: timeout)
}
    
    
// MARK: - Activities
    
extension CountriesListScreen {
    
    /// Search for country
    /// - parameter country: String
    /// - returns Self
    func searchCountry(country: String = "") -> Self {
        activity(named: "Search for Country") {
            if !searchBar.exists {
                countriesCells.swipe(direction: .down)
            }
            searchBar.clear()
            searchBar.type(text: country)
        }
        return self
    }
    
    /// Select country using a country code
    /// - parameter countryCode: String
    /// - returns Self
    @discardableResult
    func selectCountry(countryCode: String) -> Self {
        activity(named: "Select Country Code") {
            element.staticTexts[countryCode]
                .build(type: Cell.self, description: "CountryCell")
                .assert(state: .exist)?
                .tap()
        }
        return self
    }
    
    /// Select country by position from list
    /// - parameter numberFromList: Int. A Position from list to be selected from
    /// - returns Self
    @discardableResult
    func selectCountry(numberFromList: Int) -> Self {
        activity(named: "Select Country by Positon") {
            element.cells.element(boundBy: numberFromList)
                .build(type: Cell.self, description: "CountryCell")
                .assert(state: .exist)?
                .tap()
        }
        
        return self
    }
}

// MARK: - Assertions

extension CountriesListScreen {
    
    /// Assert number of countries (cells)
    /// - parameter count: Int. A number of countries to assert
    /// - returns Self
    @discardableResult
    func assertCellsCount(count: Int) -> Self {
        activity(named: "Verify number of countries") {
            let cellCount = element.cells.count
            XCTAssertEqual(cellCount, count)
        }
    
        return self
    }
}
    

