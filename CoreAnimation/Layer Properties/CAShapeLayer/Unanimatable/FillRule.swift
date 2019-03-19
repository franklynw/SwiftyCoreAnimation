//
//  FillRule.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the shapeLayer's fillRule property
public struct FillRule: ShapeLayerPropertyConformance {
    public typealias KeyValueType = CAShapeLayerFillRule

    public let value: KeyValueType?
    public static var keyPath: String { return "fillRule" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
