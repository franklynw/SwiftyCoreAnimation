//
//  BirthRate.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the emitterLayer's birthRate property
public struct BirthRate: AnimatableEmitterLayerPropertyConformance {
    public typealias KeyValueType = Float

    public let value: KeyValueType?
    public static var keyPath: String { return "birthRate" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
