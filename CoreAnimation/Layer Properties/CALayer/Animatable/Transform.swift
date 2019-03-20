//
//  Transform.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's transform property
public struct Transform: AnimatableLayerPropertyConformance {

    public typealias KeyValueType = CATransform3D

    public let value: KeyValueType?
    public static var keyPath: String { return "transform" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /// Wrapper for the layer's transform.rotation property
    public struct Rotation: AnimatableLayerPropertyConformance {

        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return Transform.keyPath.appendingKeyPath("rotation") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /// Wrapper for the layer's transform.rotation.x property
        public struct X: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Rotation.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the layer's transform.rotation.y property
        public struct Y: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Rotation.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the layer's transform.rotation.z property
        public struct Z: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Rotation.keyPath.appendingKeyPath("z") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }

    /// Wrapper for the layer's transform.scale property
    public struct Scale: AnimatableLayerPropertyConformance {

        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return Transform.keyPath.appendingKeyPath("scale") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /// Wrapper for the layer's transform.scale.x property
        public struct X: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Scale.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the layer's transform.scale.y property
        public struct Y: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Scale.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the layer's transform.scale.z property
        public struct Z: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Scale.keyPath.appendingKeyPath("z") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }

    /// Wrapper for the layer's transform.translation property
    public struct Translation: AnimatableLayerPropertyConformance {

        public typealias KeyValueType = CGSize

        public let value: KeyValueType?
        public static var keyPath: String { return Transform.keyPath.appendingKeyPath("translation") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /// Wrapper for the layer's transform.translation.x property
        public struct X: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Translation.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the layer's transform.translation.y property
        public struct Y: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Translation.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the layer's transform.translation.y property
        public struct Z: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Translation.keyPath.appendingKeyPath("z") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }
}
