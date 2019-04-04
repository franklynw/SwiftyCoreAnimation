//
//  BorderWidth.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's borderWidth property, as CGFloat

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGFloat

 ## Usage Examples ##
 ````
 myLayer.set(BorderWidth(2))
 let borderWidth = myLayer.get(BorderWidth.self)
 let borderWidthDescriptor = Descriptor.Basic<BorderWidth>.from(1, to: 5, duration: 1)
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
public struct BorderWidth: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "borderWidth" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
