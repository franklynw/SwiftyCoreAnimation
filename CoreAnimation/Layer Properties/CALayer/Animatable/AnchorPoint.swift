//
//  AnchorPoint.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's anchorPoint property
public struct AnchorPoint: AnimatableLayerPropertyConformance {
    
    public typealias KeyValueType = CGPoint

    public let value: KeyValueType?
    public static var keyPath: String { return "anchorPoint" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /// Wrapper for the layer's anchorPoint.x property
    public struct X: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return AnchorPoint.keyPath.appendingKeyPath("x") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /// Wrapper for the layer's anchorPoint.y property
    public struct Y: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return AnchorPoint.keyPath.appendingKeyPath("y") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /// Wrapper for the layer's anchorPointZ property
    public struct Z: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return "anchorPointZ" }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }
}
