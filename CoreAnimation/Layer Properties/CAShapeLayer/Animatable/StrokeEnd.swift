//
//  StrokeEnd.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAShapeLayer's strokeEnd property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGFloat

 ## Usage Examples ##
 ````
 myLayer.set(StrokeEnd(1))
 let strokeEnd = myLayer.get(StrokeEnd.self)
 let strokeEndDescriptor = Descriptor.Basic<StrokeEnd>.from(0, to: 1, duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - ShapeLayerProperty
*/
public struct StrokeEnd: AnimatableShapeLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "strokeEnd" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
