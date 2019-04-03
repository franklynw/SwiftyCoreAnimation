//
//  Hidden.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CALayer's isHidden property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: Bool

 ## Usage Examples ##
 ````
 myLayer.set(Hidden(false))
 let isHidden = myLayer.get(Hidden.self)
 let isHiddenDescriptor = Descriptor.Basic<Hidden>.from(true, to: false, duration: 1)
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
public struct Hidden: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = Bool

    public let value: KeyValueType?
    public static var keyPath: String { return "hidden" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
