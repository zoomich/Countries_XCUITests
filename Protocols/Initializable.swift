//
//  Initializable.swift
//  CountriesChallengeUITests
//
//  Created by Anton Kramarenko on 15.06.2023.
//

import XCTest

protocol Initializable {
    
    var element: XCUIElement { get }
    var description: String { get }
    var timeout: Double { get }
    
    /// Initialize UI Element - wrapper around XCUIElement
    /// - parameter element
    /// - parameter description
    /// - parameter timeout
    init(element: XCUIElement?, description: String?, timeout: Double?)
}
