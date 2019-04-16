//
//  Seed.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CAEmitterLayer's seed property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: UInt32

 ## Usage Examples ##
 ````
 myLayer.set(Seed(5))
 let seed = myLayer.get(Seed.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - EmitterLayerProperty
*/
public struct Seed: EmitterLayerPropertyConformance {
    public typealias KeyValueType = UInt32

    public let value: KeyValueType?
    public static var keyPath: String { return "seed" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
