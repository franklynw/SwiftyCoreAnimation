//
//  Colors.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the gradientLayer's colors property
public struct Colors: AnimatableGradientLayerPropertyConformance {
    public typealias KeyValueType = Array<UIColor>

    public let value: KeyValueType?
    public static var keyPath: String { return "colors" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /// Wrapper for the gradientLayer's colors property, but as [CGColor]
    public struct CGColors: AnimatableGradientLayerPropertyConformance {
        public typealias KeyValueType = Array<CGColor>

        public let value: KeyValueType?
        public static var keyPath: String { return Colors.keyPath }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
