//
//  LineDashPattern.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CAShapeLayer's lineDashPattern property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: [Int]

 ## Usage Examples ##
 ````
 myLayer.set(LineDashPattern([1,3,2]))
 let lineDashPattern = myLayer.get(LineDashPattern.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - ShapeLayerProperty
*/
public struct LineDashPattern: ShapeLayerPropertyConformance {
    public typealias KeyValueType = [Int]

    public let value: KeyValueType?
    public static var keyPath: String { return "lineDashPattern" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}

