//
//  Seed.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the emitterLayer's seed property
public struct Seed: EmitterLayerPropertyConformance {
    public typealias KeyValueType = UInt32

    public let value: KeyValueType?
    public static var keyPath: String { return "seed" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
