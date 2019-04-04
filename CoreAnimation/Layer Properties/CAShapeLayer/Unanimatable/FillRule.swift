//
//  FillRule.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAShapeLayer's fillRule property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: CAShapeLayerFillRule

 ## Usage Examples ##
 ````
 myLayer.set(FillRule(.nonZero))
 let fillRule = myLayer.get(FillRule.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - ShapeLayerProperty
*/
public struct FillRule: ShapeLayerPropertyConformance {
    public typealias KeyValueType = CAShapeLayerFillRule

    public let value: KeyValueType?
    public static var keyPath: String { return "fillRule" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
