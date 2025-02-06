//
//  XCUIElement.swift
//  CountriesChallengeUITests
//
//  Created by Anton Kramarenko on 15.06.2023.
//

import XCTest

extension XCUIElement {
    
    func build<T: Initializable>(description: String = "\(T.self)", timeout: Double = defaultTimeout) -> T {
        build(type: T.self, description: description, timeout: timeout)
    }
    
    func build<T: Initializable>(type: T.Type, description: String = "\(T.self)", timeout: Double = defaultTimeout) -> T {
        type.init(element: self, description: description, timeout: timeout)
    }
}
