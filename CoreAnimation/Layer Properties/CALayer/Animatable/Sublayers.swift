//
//  Sublayers.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's subLayers property
public struct Sublayers: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = Array<CALayer>

    public let value: KeyValueType?
    public static var keyPath: String { return "sublayers" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
