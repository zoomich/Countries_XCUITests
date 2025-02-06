//
//  States.swift
//  CountriesChallengeUITests
//
//  Created by Anton Kramarenko on 15.06.2023.
//

import XCTest

protocol States: Initializable {
    
    var exists: Bool { get }
    var hittable: Bool { get }
    var selected: Bool { get }
    var enabled: Bool { get }

}

extension States {
    
    var exists: Bool {
        element.exists
    }
    
    var hittable: Bool {
        element.isHittable
    }
    
    var selected: Bool {
        element.isSelected
    }
    
    var enabled: Bool {
        element.isEnabled
    }
}

extension States {
    
    /// Function to wait for specific state
    /// - parameter state: Enum. Element state: .exist, .hittable, .selected, .enabled
    /// - parameter result: Boolean. Expected state result true or false
    /// - returns : true if state precondition was satisfied and timeout was not exide
    func wait(state: ElementStateType = .exist, result: Bool = true) -> Bool {
        let preficate = state.predicate(result: result)
        let expectation = XCTNSPredicateExpectation(predicate: preficate, object: element)
        return XCTWaiter.wait(for: [expectation], timeout: timeout) == .completed
    }
    
    /// Function to wait for specific state
    /// - parameter state: Enum. Element state: .exist, .hittable, .selected, .enabled
    /// - parameter result: Boolean. Expected state result true or false
    /// - returns : self if state precondition was satisfied or nil
    func wait(state: ElementStateType = .exist, result: Bool = true) -> Self? {
        wait(state: state, result: result) ? self : nil
    }
    
    
    /// Function to assert for specific state
    /// - parameter state: Enum. Element state: .exist, .hittable, .selected, .enabled
    /// - parameter result: Boolean. Expected state result true or false
    /// - parameter message: String.
    /// - returns : self if state precondition was satisfied or nil
    func assert(state: ElementStateType = .exist, result: Bool = true, message: String? = nil) -> Self? {
        guard wait(state: state, result: result) else {
            let message = message ??
            #"Element: "\#(description)" state: "\#(state.rawValue)" is not equal to "\#(result)"."#
            XCTFail(message)
            return nil
        }
        return self
    }
}

enum ElementStateType: String {
    
    case exist
    case hittable
    case selected
    case enabled
}

extension ElementStateType {
    func predicate(result: Bool) -> NSPredicate {
        switch self {
        case .exist:
            return .keyPath(\XCUIElement.exists, value: result)
        case .hittable:
            return .keyPath(\XCUIElement.isHittable, value: result)
        case .selected:
            return .keyPath(\XCUIElement.isSelected, value: result)
        case .enabled:
            return .keyPath(\XCUIElement.isEnabled, value: result)
        }
    }
}

