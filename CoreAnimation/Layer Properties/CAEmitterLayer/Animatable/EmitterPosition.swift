//
//  EmitterPosition.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the emitterLayer's emitterPosition property
public struct EmitterPosition: AnimatableEmitterLayerPropertyConformance {

    public typealias KeyValueType = CGPoint // x & y

    public let value: KeyValueType?
    public static var keyPath: String { return "emitterPosition" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /// Wrapper for the emitterLayer's emitterPosition.x property
    public struct X: AnimatableEmitterLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return EmitterPosition.keyPath.appendingKeyPath("x") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /// Wrapper for the emitterLayer's emitterPosition.y property
    public struct Y: AnimatableEmitterLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return EmitterPosition.keyPath.appendingKeyPath("y") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /// Wrapper for the emitterLayer's emitterZPosition property
    public struct Z: AnimatableEmitterLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return "emitterZPosition" }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }
}
