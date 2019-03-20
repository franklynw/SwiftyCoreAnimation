//
//  RasterizationScale.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's rasterizationScale property
public struct RasterizationScale: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "rasterizationScale" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
