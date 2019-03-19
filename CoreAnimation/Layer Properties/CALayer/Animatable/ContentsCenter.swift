//
//  ContentsCenter.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's contentsRect property
public struct ContentsCenter: AnimatableLayerPropertyConformance {

    public typealias KeyValueType = CGRect

    public let value: KeyValueType?
    public static var keyPath: String { return "contentsCenter" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /// Wrapper for the layer's contentsCenter.origin property
    public struct Origin: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGPoint

        public let value: KeyValueType?
        public static var keyPath: String { return ContentsCenter.keyPath.appendingKeyPath("origin") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /// Wrapper for the layer's contentsCenter.origin.x property
        public struct X: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Origin.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the layer's contentsCenter.origin.y property
        public struct Y: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Origin.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }

    /// Wrapper for the layer's contentsCenter.size property
    public struct Size: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGSize

        public let value: KeyValueType?
        public static var keyPath: String { return ContentsCenter.keyPath.appendingKeyPath("size") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /// Wrapper for the layer's contentsCenter.size.width property
        public struct Width: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Size.keyPath.appendingKeyPath("width") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the layer's contentsCenter.size.height property
        public struct Height: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Size.keyPath.appendingKeyPath("height") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }
}
