//
//  DoubleSided.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CALayer's isDoubleSided property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: Bool

 ## Usage Examples ##
 ````
 myLayer.set(DoubleSided(false))
 let doubleSided = myLayer.get(DoubleSided.self)
 let doubleSidedDescriptor = Descriptor.Basic<DoubleSided>.from(true, to: false, duration: 1)
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
public struct DoubleSided: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = Bool

    public let value: KeyValueType?
    public static var keyPath: String { return "doubleSided" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
