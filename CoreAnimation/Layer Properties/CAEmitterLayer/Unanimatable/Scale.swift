//
//  EmitterCell.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CAEmitterLayer's scale property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: Float

 ## Usage Examples ##
 ````
 myLayer.set(Scale(0.5))
 let scale = myLayer.get(Scale.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - EmitterLayerProperty
*/
public struct Scale: EmitterLayerPropertyConformance {
    public typealias KeyValueType = Float

    public let value: KeyValueType?
    public static var keyPath: String { return "scale" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
