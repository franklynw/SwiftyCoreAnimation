//
//  Path.swift
//  CoreAnimation
//
//  Created by Franklyn on 28/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's shadowPath property
public struct Path: AnimatableShapeLayerPropertyConformance {
    public typealias KeyValueType = UIBezierPath

    public let value: KeyValueType?
    public static var keyPath: String { return "path" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    public struct CGPath: AnimatableShapeLayerPropertyConformance {
        public typealias KeyValueType = UIKit.CGPath

        public let value: KeyValueType?
        public static var keyPath: String { return "path" }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
