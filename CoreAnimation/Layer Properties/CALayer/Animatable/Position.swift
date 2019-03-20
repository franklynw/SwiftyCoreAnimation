//
//  Position.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's position property
public struct Position: AnimatableLayerPropertyConformance {

    public typealias KeyValueType = CGPoint // x & y

    public let value: KeyValueType?
    public static var keyPath: String { return "position" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /// Wrapper for the layer's position.x property
    public struct X: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return Position.keyPath.appendingKeyPath("x") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /// Wrapper for the layer's position.y property
    public struct Y: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return Position.keyPath.appendingKeyPath("y") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /// Wrapper for the layer's zPosition property
    public struct Z: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return "zPosition" }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }
}
