//
//  ShouldRasterize.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CALayer's shouldRasterize property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: Bool

 ## Usage Examples ##
 ````
 myLayer.set(ShouldRasterize(false))
 let shouldRasterize = myLayer.get(ShouldRasterize.self)
 let shouldRasterizeDescriptor = Descriptor.Basic<ShouldRasterize>.from(true, to: false, duration: 1)
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
public struct ShouldRasterize: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = Bool

    public let value: KeyValueType?
    public static var keyPath: String { return "shouldRasterize" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
