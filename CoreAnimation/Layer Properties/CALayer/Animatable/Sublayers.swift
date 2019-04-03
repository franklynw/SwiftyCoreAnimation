//
//  Sublayers.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's subLayers property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: [CALayer]

 ## Usage Examples ##
 ````
 myLayer.set(Sublayers(myLayersArray))
 let sublayers = myLayer.get(Sublayers.self)
 let sublayersDescriptor = Descriptor.Basic<Sublayers>.from(myLayersArray, to: myOtherLayersArray, duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - LayerProperty
 - ShapeLayerProperty
 - EmitterLayerProperty
 - GradientLayerProperty
 - ReplicatorLayerProperty
 - TextLayerProperty
*/
public struct Sublayers: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = Array<CALayer>

    public let value: KeyValueType?
    public static var keyPath: String { return "sublayers" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
