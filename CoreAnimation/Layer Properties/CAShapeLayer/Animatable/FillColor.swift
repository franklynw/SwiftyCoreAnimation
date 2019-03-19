//
//  FillColor.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the shapeLayer's fillColor property
public struct FillColor: AnimatableShapeLayerPropertyConformance {
    public typealias KeyValueType = UIColor

    public let value: KeyValueType?
    public static var keyPath: String { return "fillColor" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /// Wrapper for the layer's fillColor property, but as CGColor
    public struct CGColor: AnimatableShapeLayerPropertyConformance {
        public typealias KeyValueType = UIKit.CGColor

        public let value: KeyValueType?
        public static var keyPath: String { return FillColor.keyPath }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
