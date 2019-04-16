//
//  EmitterShape.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAEmitterLayer's emitterShape property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: CAEmitterLayerEmitterShape

 ## Usage Examples ##
 ````
 myLayer.set(EmitterShape(.cuboid))
 let emitterShape = myLayer.get(EmitterShape.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - EmitterLayerProperty
*/
public struct EmitterShape: EmitterLayerPropertyConformance {
    public typealias KeyValueType = CAEmitterLayerEmitterShape

    public let value: KeyValueType?
    public static var keyPath: String { return "emitterShape" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
