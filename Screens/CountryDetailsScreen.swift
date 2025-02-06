//
//  CountryDetailsScreen.swift
//  CountriesChallengeUITests
//
//  Created by Anton Kramarenko on 15.06.2023.
//

import XCTest

class CountryDetailsScreen: BaseElement {
    
    private lazy var navigationBarLabel: Label = element.staticTexts.firstMatch
        .build( description: "\(description).NavigationBarLabel", timeout: timeout)
    private lazy var backButton: Button = element.buttons["Countries"]
        .build(description: "\(description).BackButton", timeout: timeout)
    private lazy var countryName: Label = element.staticTexts.element(boundBy: 1)
        .build( description: "\(description).CountryNameLabel", timeout: timeout)
    private lazy var countryCode: Label = element.staticTexts.element(boundBy: 2)
        .build( description: "\(description).CountryCodeLabel", timeout: timeout)
    private lazy var countryCapitol: Label = element.staticTexts.element(boundBy: 3)
        .build( description: "\(description).CountryCapitolLabel", timeout: timeout)
    
}
    
    
// MARK: - Activities
    
extension CountryDetailsScreen {
        
    //Method to navigate back to the CountriesListScreen
    func back() {
        activity(named: "Navigate back to the main screen") {
            backButton.assert(state: .hittable)?.tap()
        }
    }
    
}

// MARK: - Assertions

extension CountryDetailsScreen {
    
    @discardableResult
    func assertScreenElements(country: String, zone: String, capitol: String, code: String) -> Self {
        activity(named: "Verify CountryDetailsScreen elements") {
            XCTAssertEqual(navigationBarLabel.element.label, country)
            XCTAssertEqual(countryName.element.label, country + ", " + zone)
            XCTAssertEqual(countryCode.element.label, code)
        }
        return self
    }
    
    @discardableResult
    func assertAppearence() -> Self {
        activity(named: "Verify CountryDetailsScreen appearance") {
            XCTAssertTrue(navigationBarLabel.exists, "NavigationBar label does not exist")
            XCTAssertTrue(navigationBarLabel.exists, "CountryCode label does not exist")
        }
        
        return self
    }
}
