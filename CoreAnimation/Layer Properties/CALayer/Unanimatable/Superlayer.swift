//
//  Superlayer.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's superlayer property

 Use with SwiftyCoreAnimation's get function
 - KeyValueType: CALayer

 ## Usage Examples ##
 ````
 let superlayer = myLayer.get(Superlayer.self)
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
public struct Superlayer: UnsettableLayerPropertyConformance {
    public typealias KeyValueType = CALayer

    public let value: KeyValueType?
    public static var keyPath: String { return "superlayer" }
}
