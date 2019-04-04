//
//  Lifetime.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CAEmitterLayer's lifetime property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: Float

 ## Usage Examples ##
 ````
 myLayer.set(Lifetime(2))
 let lifetime = myLayer.get(Lifetime.self)
 let lifetimeDescriptor = Descriptor.Basic<Lifetime>.from(0.1, to: 2, duration: 3)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - EmitterLayerProperty
*/
public struct Lifetime: AnimatableEmitterLayerPropertyConformance {
    public typealias KeyValueType = Float

    public let value: KeyValueType?
    public static var keyPath: String { return "lifetime" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
