//
//  ShouldRasterize.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the layer's shouldRasterize property
public struct ShouldRasterize: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = Bool

    public let value: KeyValueType?
    public static var keyPath: String { return "shouldRasterize" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
