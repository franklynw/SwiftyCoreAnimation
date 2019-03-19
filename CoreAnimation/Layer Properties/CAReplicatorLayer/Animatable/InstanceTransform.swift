//
//  InstanceTransform.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the replicatorLayer's instanceTransform property
public struct InstanceTransform: AnimatableReplicatorLayerPropertyConformance {

    public typealias KeyValueType = CATransform3D

    public let value: KeyValueType?
    public static var keyPath: String { return "instanceTransform" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /// Wrapper for the replicatorLayer's instanceTransform.rotation property
    public struct Rotation: AnimatableReplicatorLayerPropertyConformance {

        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return InstanceTransform.keyPath.appendingKeyPath("rotation") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /// Wrapper for the replicatorLayer's instanceTransform.rotation.x property
        public struct X: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Rotation.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the replicatorLayer's instanceTransform.rotation.y property
        public struct Y: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Rotation.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the replicatorLayer's instanceTransform.rotation.z property
        public struct Z: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Rotation.keyPath.appendingKeyPath("z") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }

    /// Wrapper for the replicatorLayer's instanceTransform.scale property
    public struct Scale: AnimatableReplicatorLayerPropertyConformance {

        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return InstanceTransform.keyPath.appendingKeyPath("scale") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /// Wrapper for the replicatorLayer's instanceTransform.scale.x property
        public struct X: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Scale.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the replicatorLayer's instanceTransform.scale.y property
        public struct Y: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Scale.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the replicatorLayer's instanceTransform.scale.z property
        public struct Z: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Scale.keyPath.appendingKeyPath("z") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }

    /// Wrapper for the replicatorLayer's instanceTransform.translation property
    public struct Translation: AnimatableReplicatorLayerPropertyConformance {

        public typealias KeyValueType = CGSize

        public let value: KeyValueType?
        public static var keyPath: String { return InstanceTransform.keyPath.appendingKeyPath("translation") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /// Wrapper for the replicatorLayer's instanceTransform.translation.x property
        public struct X: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Translation.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the replicatorLayer's instanceTransform.translation.y property
        public struct Y: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Translation.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /// Wrapper for the replicatorLayer's instanceTransform.translation.z property
        public struct Z: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Translation.keyPath.appendingKeyPath("z") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }
}
