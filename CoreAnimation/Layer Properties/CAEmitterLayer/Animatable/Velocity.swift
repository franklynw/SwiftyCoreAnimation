//
//  Velocity.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CAEmitterLayer's velocity property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: Float

 ## Usage Examples ##
 ````
 myLayer.set(Velocity(2))
 let velocity = myLayer.get(Velocity.self)
 let velocityDescriptor = Descriptor.Basic<Velocity>.from(0.5, to: 4, duration: 3)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - EmitterLayerProperty
*/
public struct Velocity: AnimatableEmitterLayerPropertyConformance {
    public typealias KeyValueType = Float

    public let value: KeyValueType?
    public static var keyPath: String { return "velocity" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
