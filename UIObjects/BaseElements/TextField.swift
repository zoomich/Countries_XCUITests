//
//  TextField.swift
//  CountriesChallengeUITests
//
//  Created by Anton Kramarenko on 15.06.2023.
//

import XCTest
import Foundation

class TextField: BaseElement, Values, States, Interactions {
    
    var placeholderValue: String {
        element.placeholderValue ?? ""
    }
    
    func tap() -> Self {
        element.tap()
        return self
    }
    
    func type(text: String) {
        element.tap()
        element.typeText(text)
    }
    
    @discardableResult
    func clear() -> Self {
        type(text: String(repeating: XCUIKeyboardKey.delete.rawValue, count: value?.count ?? 0))
        return self
    }
}
