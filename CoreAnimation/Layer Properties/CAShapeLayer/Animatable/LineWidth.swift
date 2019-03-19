//
//  LineWidth.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the shapeLayer's lineWidth property
public struct LineWidth: AnimatableShapeLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "lineWidth" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
