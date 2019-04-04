//
//  BirthRate.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CAEmitterLayer's birthRate property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: Float

 ## Usage Examples ##
 ````
 myLayer.set(BirthRate(2))
 let birthRate = myLayer.get(BirthRate.self)
 let birthRateDescriptor = Descriptor.Basic<BirthRate>.from(0.5, to: 4, duration: 3)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - EmitterLayerProperty
*/
public struct BirthRate: AnimatableEmitterLayerPropertyConformance {
    public typealias KeyValueType = Float

    public let value: KeyValueType?
    public static var keyPath: String { return "birthRate" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
