//
//  EmitterDepth.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAEmitterLayer's emitterDepth property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGFloat

 ## Usage Examples ##
 ````
 myLayer.set(EmitterDepth(1))
 let emitterDepth = myLayer.get(EmitterDepth.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - EmitterLayerProperty
*/
public struct EmitterDepth: EmitterLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "emitterDepth" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
