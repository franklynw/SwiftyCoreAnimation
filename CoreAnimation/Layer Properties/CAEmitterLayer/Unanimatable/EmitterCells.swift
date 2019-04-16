//
//  EmitterCells.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAEmitterLayer's emitterCells property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: [CAEmitterCell]

 ## Usage Examples ##
 ````
 myLayer.set(EmitterCells([myEmitterCells]))
 let emitterCells = myLayer.get(EmitterCells.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - EmitterLayerProperty
*/
public struct EmitterCells: EmitterLayerPropertyConformance {
    public typealias KeyValueType = [CAEmitterCell]

    public let value: KeyValueType?
    public static var keyPath: String { return "emitterCells" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
