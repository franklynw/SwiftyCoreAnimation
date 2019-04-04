//
//  CornerRadius.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's cornerRadius property, as CGFloat

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGFloat

 ## Usage Examples ##
 ````
 myLayer.set(CornerRadius(2))
 let cornerRadius = myLayer.get(CornerRadius.self)
 let cornerRadiusDescriptor = Descriptor.Basic<CornerRadius>.from(1, to: 5, duration: 1)
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
public struct CornerRadius: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "cornerRadius" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
