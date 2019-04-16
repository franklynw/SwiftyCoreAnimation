//
//  RenderMode.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAEmitterLayer's renderMode property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: CAEmitterLayerRenderMode

 ## Usage Examples ##
 ````
 myLayer.set(RenderMode(.oldestFirst))
 let renderMode = myLayer.get(RenderMode.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - EmitterLayerProperty
*/
public struct RenderMode: EmitterLayerPropertyConformance {
    public typealias KeyValueType = CAEmitterLayerRenderMode

    public let value: KeyValueType?
    public static var keyPath: String { return "renderMode" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
