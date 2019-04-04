//
//  Name.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CALayer's name property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: String

 ## Usage Examples ##
 ````
 myLayer.set(Name("Fred"))
 let name = myLayer.get(Name.self)
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
public struct Name: LayerPropertyConformance {
    public typealias KeyValueType = String

    public let value: KeyValueType?
    public static var keyPath: String { return "name" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
