//
//  ContentsGravity.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's contentsGravity property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CALayerContentsGravity

 ## Usage Examples ##
 ````
 myLayer.set(ContentsGravity(gravity))
 let contentsGravity = myLayer.get(ContentsGravity.self)
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
public struct ContentsGravity: LayerPropertyConformance {
    public typealias KeyValueType = CALayerContentsGravity

    public let value: KeyValueType?
    public static var keyPath: String { return "contentsGravity" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
