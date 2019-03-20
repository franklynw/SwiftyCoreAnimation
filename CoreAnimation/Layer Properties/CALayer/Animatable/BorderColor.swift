//
//  BorderColor.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's borderColor property
public struct BorderColor: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = UIColor

    public let value: KeyValueType?
    public static var keyPath: String { return "borderColor" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /// Wrapper for the layer's borderColor property, but as CGColor
    public struct CGColor: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = UIKit.CGColor

        public let value: KeyValueType?
        public static var keyPath: String { return BorderColor.keyPath }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
