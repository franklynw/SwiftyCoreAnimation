//
//  LineCap.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the shapeLayer's lineCap property
public struct LineCap: ShapeLayerPropertyConformance {
    public typealias KeyValueType = CAShapeLayerLineCap

    public let value: KeyValueType?
    public static var keyPath: String { return "lineCap" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
