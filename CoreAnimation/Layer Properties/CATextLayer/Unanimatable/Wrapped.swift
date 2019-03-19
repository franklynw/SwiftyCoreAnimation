//
//  Wrapped.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the textLayer's isWrapped property
public struct Wrapped: TextLayerPropertyConformance {
    public typealias KeyValueType = Bool

    public let value: KeyValueType?
    public static var keyPath: String { return "wrapped" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
