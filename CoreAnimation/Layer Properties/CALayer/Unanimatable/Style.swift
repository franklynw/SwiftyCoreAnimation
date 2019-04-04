//
//  Style.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CALayer's style property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: [AnyHashable: Any]

 ## Usage Examples ##
 ````
 myLayer.set(Style(styleDict))
 let style = myLayer.get(Style.self)
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
public struct Style: LayerPropertyConformance {
    public typealias KeyValueType = [AnyHashable: Any]

    public let value: KeyValueType?
    public static var keyPath: String { return "style" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
