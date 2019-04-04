//
//  LineCap.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAShapeLayer's lineCap property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: CAShapeLayerLineCap

 ## Usage Examples ##
 ````
 myLayer.set(LineCap(.round))
 let lineCap = myLayer.get(LineCap.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - ShapeLayerProperty
*/
public struct LineCap: ShapeLayerPropertyConformance {
    public typealias KeyValueType = CAShapeLayerLineCap

    public let value: KeyValueType?
    public static var keyPath: String { return "lineCap" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
