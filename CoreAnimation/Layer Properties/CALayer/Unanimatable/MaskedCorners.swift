//
//  MaskedCorners.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's maskedCorners property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: CACornerMask

 ## Usage Examples ##
 ````
 myLayer.set(MaskedCorners(cornerMask))
 let maskedCorners = myLayer.get(MaskedCorners.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - LayerProperty
 - ShapeLayerProperty
 - EmitterLayerProperty
 - GradientLayerProperty
 - ReplicatorLayerProperty
 - TextLayerProperty
*/
@available(iOS 11.0, *)
public struct MaskedCorners: LayerPropertyConformance {
    public typealias KeyValueType = CACornerMask

    public let value: KeyValueType?
    public static var keyPath: String { return "maskedCorners" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
