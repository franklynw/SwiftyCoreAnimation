//
//  Mask.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's mask property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CALayer

 ## Usage Examples ##
 ````
 myLayer.set(Mask(myMaskLayer))
 let mask = myLayer.get(Mask.self)
 let maskDescriptor = Descriptor.Basic<Mask>.from(myMaskLayer, to: myOtherMaskLayer, duration: 1)
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
public struct Mask: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = CALayer

    public let value: KeyValueType?
    public static var keyPath: String { return "mask" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
