//
//  LineWidth.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAShapeLayer's lineWidth property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGFloat

 ## Usage Examples ##
 ````
 myLayer.set(LineWidth(3))
 let lineWidth = myLayer.get(LineWidth.self)
 let lineWidthDescriptor = Descriptor.Basic<LineWidth>.from(1, to: 5, duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - ShapeLayerProperty
*/
public struct LineWidth: AnimatableShapeLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "lineWidth" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
