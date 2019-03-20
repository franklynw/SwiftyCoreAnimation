//
//  SublayerTransform.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's sublayerTransform property
public struct SublayerTransform: AnimatableLayerPropertyConformance {

    public typealias KeyValueType = CATransform3D

    public let value: KeyValueType?
    public static var keyPath: String { return "sublayerTransform" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /// Wrapper for the layer's sublayerTransform.rotation property
    public struct Rotation: AnimatableLayerPropertyConformance {

        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return SublayerTransform.keyPath.appendingKeyPath("rotation") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /// Wrapper for the layer's sublayerTransform.rotation.x property
        public struct X: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Rotation.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the layer's sublayerTransform.rotation.y property
        public struct Y: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Rotation.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the layer's sublayerTransform.rotation.z property
        public struct Z: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Rotation.keyPath.appendingKeyPath("z") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }

    /// Wrapper for the layer's sublayerTransform.scale property
    public struct Scale: AnimatableLayerPropertyConformance {

        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return SublayerTransform.keyPath.appendingKeyPath("scale") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /// Wrapper for the layer's sublayerTransform.scale.x property
        public struct X: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Scale.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the layer's sublayerTransform.scale.y property
        public struct Y: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Scale.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the layer's sublayerTransform.scale.z property
        public struct Z: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Scale.keyPath.appendingKeyPath("z") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }

    /// Wrapper for the layer's sublayerTransform.translation property
    public struct Translation: AnimatableLayerPropertyConformance {

        public typealias KeyValueType = CGSize

        public let value: KeyValueType?
        public static var keyPath: String { return SublayerTransform.keyPath.appendingKeyPath("translation") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /// Wrapper for the layer's sublayerTransform.translation.x property
        public struct X: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Translation.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the layer's sublayerTransform.translation.y property
        public struct Y: AnimatableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Translation.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the layer's sublayerTransform.translation.z property
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
