//
//  AllowsEdgeAntialiasing.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CALayer's allowsEdgeAntialiasing property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: Bool

 ## Usage Examples ##
 ````
 myLayer.set(AllowsEdgeAntialiasing(true))
 let allowsEdgeAntialiasing = myLayer.get(AllowsEdgeAntialiasing.self)
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
public struct AllowsEdgeAntialiasing: LayerPropertyConformance {
    public typealias KeyValueType = Bool

    public let value: KeyValueType?
    public static var keyPath: String { return "allowsEdgeAntialiasing" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
