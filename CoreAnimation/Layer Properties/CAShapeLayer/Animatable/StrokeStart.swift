//
//  StrokeStart.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAShapeLayer's strokeStart property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGFloat

 ## Usage Examples ##
 ````
 myLayer.set(StrokeStart(0))
 let strokeStart = myLayer.get(StrokeStart.self)
 let strokeStartDescriptor = Descriptor.Basic<StrokeStart>.from(1, to: 0, duration: 3)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - ShapeLayerProperty
*/
public struct StrokeStart: AnimatableShapeLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "strokeStart" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
