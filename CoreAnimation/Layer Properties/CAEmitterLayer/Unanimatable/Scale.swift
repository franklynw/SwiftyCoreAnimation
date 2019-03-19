//
//  EmitterCell.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the emitterLayer's scale property
public struct Scale: EmitterLayerPropertyConformance {
    public typealias KeyValueType = Float

    public let value: KeyValueType?
    public static var keyPath: String { return "scale" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
