//
//  LineJoin.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the shapeLayer's lineJoin property
public struct LineJoin: ShapeLayerPropertyConformance {
    public typealias KeyValueType = CAShapeLayerLineJoin

    public let value: KeyValueType?
    public static var keyPath: String { return "lineJoin" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
