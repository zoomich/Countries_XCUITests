//
//  CountriesChallengeUITests.swift
//  CountriesChallengeUITests
//

import XCTest

class CountriesChallengeUITests: BaseTest {
    
    // Verify Search functionality
    func test001_verifySearchCountryResults() throws {
        let country = "United States of America"
        
        CountriesListScreen()
            .searchCountry(country: country)
            .assertCellsCount(count: 1)
    }
    
    // Verify Search clearence and full list of countries should be fetched back
    func test002_verifySearchIsClearedAndFullCountryListFetchedBack() throws {
        let country = "United States of America"
        let countryCodesCount = 249
        
        CountriesListScreen()
            .searchCountry(country: country)
            .assertCellsCount(count: 1)
            .searchCountry()
            .assertCellsCount(count: countryCodesCount)
    }
    
    // Verify CountryDetailsScreen is present and UI elements
    func test003_verifyCountryDetailsScreen() throws {
        let country = "Italy"
        
        CountriesListScreen()
            .selectCountry(countryCode: "IT")
        
        CountryDetailsScreen()
            .assertScreenElements(country: country, zone: "EU", capitol: "Rome", code: "IT")
    }
    
    // Verify ability to navigate to the main screen using the back button
    func test004_verifyRedirectBackToCounriesListUsingBackButtonOnDetailsScreen() throws {
        
        CountriesListScreen()
            .selectCountry(numberFromList: 0)
        
        CountryDetailsScreen()
            .assertAppearence()
            .back()
        
        CountriesListScreen()
            .assertCellsCount(count: 249)

    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
