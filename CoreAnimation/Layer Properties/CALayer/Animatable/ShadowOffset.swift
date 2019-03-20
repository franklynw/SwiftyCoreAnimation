//
//  ShadowOffset.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's shadowOffset property
public struct ShadowOffset: AnimatableLayerPropertyConformance {

    public typealias KeyValueType = CGSize

    public let value: KeyValueType?
    public static var keyPath: String { return "shadowOffset" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /// Wrapper for the layer's shadowOffset.width property
    public struct Width: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return ShadowOffset.keyPath.appendingKeyPath("width") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /// Wrapper for the layer's shadowOffset.height property
    public struct Height: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return ShadowOffset.keyPath.appendingKeyPath("height") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }
}
