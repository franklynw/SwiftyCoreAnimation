//
//  AllowsGroupOpacity.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CALayer's allowsGroupOpacity property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: Bool

 ## Usage Examples ##
 ````
 myLayer.set(AllowsGroupOpacity(true))
 let allowsGroupOpacity = myLayer.get(AllowsGroupOpacity.self)
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
public struct AllowsGroupOpacity: LayerPropertyConformance {
    public typealias KeyValueType = Bool

    public let value: KeyValueType?
    public static var keyPath: String { return "allowsGroupOpacity" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
