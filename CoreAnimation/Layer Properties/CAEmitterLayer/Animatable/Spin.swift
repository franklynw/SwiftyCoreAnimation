//
//  Spin.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the emitterLayer's spin property
public struct Spin: AnimatableEmitterLayerPropertyConformance {
    public typealias KeyValueType = Float

    public let value: KeyValueType?
    public static var keyPath: String { return "spin" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
