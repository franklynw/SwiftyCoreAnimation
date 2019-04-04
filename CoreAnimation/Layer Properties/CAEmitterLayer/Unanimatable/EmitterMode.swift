//
//  EmitterMode.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAEmitterLayer's emitterMode property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: CAEmitterLayerEmitterMode

 ## Usage Examples ##
 ````
 myLayer.set(EmitterMode(.surface))
 let emitterMode = myLayer.get(EmitterMode.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - EmitterLayerProperty
*/
public struct EmitterMode: EmitterLayerPropertyConformance {
    public typealias KeyValueType = CAEmitterLayerEmitterMode

    public let value: KeyValueType?
    public static var keyPath: String { return "emitterMode" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
