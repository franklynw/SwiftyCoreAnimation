//
//  EmitterPreservesDepth.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CAEmitterLayer's preservesDepth property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: Bool

 ## Usage Examples ##
 ````
 myLayer.set(EmitterPreservesDepth(false))
 let preservesDepth = myLayer.get(EmitterPreservesDepth.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - EmitterLayerProperty
*/
public struct EmitterPreservesDepth: EmitterLayerPropertyConformance {
    public typealias KeyValueType = Bool

    public let value: KeyValueType?
    public static var keyPath: String { return "preservesDepth" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
