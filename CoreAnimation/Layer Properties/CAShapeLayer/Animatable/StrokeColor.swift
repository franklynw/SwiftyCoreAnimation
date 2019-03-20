//
//  StrokeColor.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the shapeLayer's strokeColor property
public struct StrokeColor: AnimatableShapeLayerPropertyConformance {
    public typealias KeyValueType = UIColor

    public let value: KeyValueType?
    public static var keyPath: String { return "strokeColor" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /// Wrapper for the layer's strokeColor property, but as CGColor
    public struct CGColor: AnimatableShapeLayerPropertyConformance {
        public typealias KeyValueType = UIKit.CGColor

        public let value: KeyValueType?
        public static var keyPath: String { return StrokeColor.keyPath }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
