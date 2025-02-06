//
//  Interactions.swift
//  CountriesChallengeUITests
//
//  Created by Anton Kramarenko on 15.06.2023.
//

import XCTest

protocol Interactions: States {}

enum SwipeDirections: String {
    case up, down, left, right
}

extension Interactions {
    
    func tap() {
        element.tap()
    }
    
    /// Swipe in any direction
    /// - parameter direction: Enum SwipeDirections
    @discardableResult
    func swipe(direction: SwipeDirections) -> Self {
        switch direction {
        case .up:
            element.swipeUp()
        case .down:
            element.swipeDown()
        case .left:
            element.swipeLeft()
        case .right:
            element.swipeRight()
        }
        return self
    }
    
    
    
}


