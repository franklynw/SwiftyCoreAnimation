//
//  RasterizationScale.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's rasterizationScale property, as CGFloat

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGFloat

 ## Usage Examples ##
 ````
 myLayer.set(RasterizationScale(0.7))
 let rasterizationScale = myLayer.get(RasterizationScale.self)
 let rasterizationScaleDescriptor = Descriptor.Basic<RasterizationScale>.from(0, to: 0.5, duration: 1)
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
public struct RasterizationScale: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "rasterizationScale" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
