//
//  ResettableLazy.swift
//
//  Created by Franklyn Weber on 10/01/2019.
//  Copyright © 2019 Franklyn Weber. All rights reserved.
//

import Foundation

// Thanks to Ben Leggiero for inspiration, tho mine is a bit different ;-) - https://stackoverflow.com/a/40847994/331854

public struct ResettableLazy<T> {

    typealias LazyInitializer<T> = () -> T
    typealias ValueType = T

    private enum LazyValue {
        case empty
        case value(T)
    }

    private var initializer: LazyInitializer<T>
    private var backingValue: LazyValue

    init(_ initializer: @escaping LazyInitializer<T>) {
        self.backingValue = .empty
        self.initializer = initializer
    }

    var value: T {
        mutating get {
            switch self.backingValue {
            case .empty:
                let value: T = self.initializer()
                self.backingValue = .value(value)
                return value
            case .value(let value):
                return value
            }
        }
        set {
            // using the setter will remove the consumer's lazy initializer, so the value will always be the new value
            self.initializer = { return newValue }
            self.backingValue = .empty
        }
    }

    mutating func reset() {
        self.backingValue = .empty // forces the initializer closure to re-evaluate the next time the value is asked for
    }
}
