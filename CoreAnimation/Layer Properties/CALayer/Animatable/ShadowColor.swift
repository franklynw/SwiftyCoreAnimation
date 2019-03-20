//
//  ShadowColor.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's shadowColor property
public struct ShadowColor: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = UIColor

    public let value: KeyValueType?
    public static var keyPath: String { return "shadowColor" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /// Wrapper for the layer's shadowColor property, but as CGColor
    public struct CGColor: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = UIKit.CGColor

        public let value: KeyValueType?
        public static var keyPath: String { return ShadowColor.keyPath }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
