//
//  EmitterSize.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the emitterLayer's emitterSize property
public struct EmitterSize: AnimatableEmitterLayerPropertyConformance {

    public typealias KeyValueType = CGSize

    public let value: KeyValueType?
    public static var keyPath: String { return "emitterSize" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /// Wrapper for the emitterLayer's emitterSize.width property
    public struct Width: AnimatableEmitterLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return EmitterSize.keyPath.appendingKeyPath("width") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /// Wrapper for the emitterLayer's emitterSize.height property
    public struct Height: AnimatableEmitterLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return EmitterSize.keyPath.appendingKeyPath("height") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }
}
