//
//  BaseElement.swift
//  CountriesChallengeUITests
//
//  Created by Anton Kramarenko on 15.06.2023.
//

import XCTest

var defaultTimeout = 5.0

class BaseElement: Initializable, Activity {
    
    let element: XCUIElement
    let description: String
    let timeout: Double
    
    required init(element: XCUIElement? = nil, description: String? = nil, timeout: Double? = nil) {
        self.element = element ?? XCUIApplication.init()
        self.description = description ?? String(describing: Self.self)
        self.timeout = timeout ?? defaultTimeout
    }
    
}

protocol Activity {
    var description: String { get }
}

extension Activity {
    
    /// Any activity can be wrapped for more readable logs
    /// - parameter named: String. Name of Activity
    /// - parameter block: String. Provide any activities
    /// - returns: optional generic type
    @discardableResult
    func activity<Result>(named: String, isChild: Bool = false, _ block: () -> Result?) -> Result? {
        XCTContext.runActivity(named: description + " " + named) { _ in block() }
    }
}
