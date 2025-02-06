//
//  MockCountriesViewModel.swift
//  CountriesChallenge
//
//  Created by Anton Kramarenko on 15.06.2023.
//

import Foundation

class MockCountriesViewModel: CountriesViewModel {
    var refreshCountriesCalled = false

    override func refreshCountries() {
        refreshCountriesCalled = true
    }
}
