//
//  NSPredicate.swift
//  CountriesChallengeUITests
//
//  Created by Anton Kramarenko on 16.06.2023.
//

import Foundation

public extension NSPredicate {
    static func keyPath<T, U>(_ keyPath: KeyPath<T, U>,
                              is type: NSComparisonPredicate.Operator = .equalTo,
                              value: U,
                              modifier: NSComparisonPredicate.Modifier = .direct,
                              options: NSComparisonPredicate.Options = []) -> NSPredicate {
            
        return NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: keyPath),
                                     rightExpression: NSExpression(forConstantValue: value),
                                     modifier: modifier,
                                     type: type,
                                     options: options
        )
    }
}
