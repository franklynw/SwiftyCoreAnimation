//
//  StrokeStart.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the shapeLayer's strokeStart property
public struct StrokeStart: AnimatableShapeLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "strokeStart" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
