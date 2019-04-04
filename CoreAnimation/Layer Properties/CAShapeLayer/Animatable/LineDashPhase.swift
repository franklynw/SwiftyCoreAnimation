//
//  LineDashPhase.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAShapeLayer's lineDashPhase property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGFloat

 ## Usage Examples ##
 ````
 myLayer.set(LineDashPhase(3))
 let lineDashPhase = myLayer.get(LineDashPhase.self)
 let lineDashPhaseDescriptor = Descriptor.Basic<LineDashPhase>.from(0, to: 5, duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - ShapeLayerProperty
*/
public struct LineDashPhase: AnimatableShapeLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "lineDashPhase" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
