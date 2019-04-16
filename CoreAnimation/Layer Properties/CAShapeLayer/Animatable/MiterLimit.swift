//
//  MiterLimit.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAShapeLayer's miterLimit property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGFloat

 ## Usage Examples ##
 ````
 myLayer.set(MiterLimit(3))
 let miterLimit = myLayer.get(MiterLimit.self)
 let miterLimitDescriptor = Descriptor.Basic<MiterLimit>.from(0, to: 5, duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - ShapeLayerProperty
*/
public struct MiterLimit: AnimatableShapeLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "miterLimit" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
