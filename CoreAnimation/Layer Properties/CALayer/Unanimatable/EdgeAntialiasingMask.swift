//
//  EdgeAntialiasingMask.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's edgeAntialiasingMask property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: CAEdgeAntialiasingMask

 ## Usage Examples ##
 ````
 myLayer.set(EdgeAntialiasingMask(mask))
 let edgeAntialiasingMask = myLayer.get(EdgeAntialiasingMask.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - LayerProperty
 - ShapeLayerProperty
 - EmitterLayerProperty
 - GradientLayerProperty
 - ReplicatorLayerProperty
 - TextLayerProperty
*/
public struct EdgeAntialiasingMask: LayerPropertyConformance {
    public typealias KeyValueType = CAEdgeAntialiasingMask

    public let value: KeyValueType?
    public static var keyPath: String { return "edgeAntialiasingMask" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
