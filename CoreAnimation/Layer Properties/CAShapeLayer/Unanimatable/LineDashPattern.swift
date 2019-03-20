//
//  LineDashPattern.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the shapeLayer's lineDashPattern property
public struct LineDashPattern: ShapeLayerPropertyConformance {
    public typealias KeyValueType = [Int]

    public let value: KeyValueType?
    public static var keyPath: String { return "lineDashPattern" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}

