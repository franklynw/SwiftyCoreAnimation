//
//  Spin.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CAEmitterLayer's spin property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: Float

 ## Usage Examples ##
 ````
 myLayer.set(Spin(2))
 let spin = myLayer.get(Spin.self)
 let spinDescriptor = Descriptor.Basic<Spin>.from(0.5, to: 2, duration: 3)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - EmitterLayerProperty
*/
public struct Spin: AnimatableEmitterLayerPropertyConformance {
    public typealias KeyValueType = Float

    public let value: KeyValueType?
    public static var keyPath: String { return "spin" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
