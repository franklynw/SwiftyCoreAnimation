//
//  EmitterShape.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the emitterLayer's emitterShape property
public struct EmitterShape: EmitterLayerPropertyConformance {
    public typealias KeyValueType = CAEmitterLayerEmitterShape

    public let value: KeyValueType?
    public static var keyPath: String { return "emitterShape" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
