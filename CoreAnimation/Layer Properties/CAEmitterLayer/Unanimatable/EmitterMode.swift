//
//  EmitterMode.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the emitterLayer's emitterMode property
public struct EmitterMode: EmitterLayerPropertyConformance {
    public typealias KeyValueType = CAEmitterLayerEmitterMode

    public let value: KeyValueType?
    public static var keyPath: String { return "emitterMode" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
