//
//  Values.swift
//  CountriesChallengeUITests
//
//  Created by Anton Kramarenko on 16.06.2023.
//

import XCTest

protocol Values: Initializable {
    
    var value: String? { get }
}

extension Values {
    
    var value: String? {
        element.value as? String
    }
}
