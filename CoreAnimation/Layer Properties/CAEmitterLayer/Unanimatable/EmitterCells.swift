//
//  EmitterCells.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the emitterLayer's emitterCells property
public struct EmitterCells: EmitterLayerPropertyConformance {
    public typealias KeyValueType = [CAEmitterCell]

    public let value: KeyValueType?
    public static var keyPath: String { return "emitterCells" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
