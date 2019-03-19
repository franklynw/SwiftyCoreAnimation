//
//  StartPoint.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the gradientLayer's startPoint property
public struct StartPoint: AnimatableGradientLayerPropertyConformance {
    public typealias KeyValueType = CGPoint

    public let value: KeyValueType?
    public static var keyPath: String { return "startPoint" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /// Wrapper for the gradientLayer's startPoint.x property
    public struct X: AnimatableGradientLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return StartPoint.keyPath.appendingKeyPath("x") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /// Wrapper for the gradientLayer's startPoint.y property
    public struct Y: AnimatableGradientLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return StartPoint.keyPath.appendingKeyPath("y") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }
}
