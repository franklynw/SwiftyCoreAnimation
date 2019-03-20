//
//  Mask.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's mask property
public struct Mask: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = CALayer

    public let value: KeyValueType?
    public static var keyPath: String { return "mask" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
