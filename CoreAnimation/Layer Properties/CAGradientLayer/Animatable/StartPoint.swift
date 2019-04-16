//
//  StartPoint.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAGradientLayer's startPoint property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGPoint

 ## Usage Examples ##
 ````
 myLayer.set(StartPoint(CGPoint(x: 0.5, y: 0.5))
 let startPoint = myLayer.get(StartPoint.self)
 let startPointDescriptor = Descriptor.Basic<StartPoint>.from(.zero, to: CGPoint(x: 1, y: 1), duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - GradientLayerProperty
*/
public struct StartPoint: AnimatableGradientLayerPropertyConformance {
    public typealias KeyValueType = CGPoint

    public let value: KeyValueType?
    public static var keyPath: String { return "startPoint" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /**
     Wrapper for the CAGradientLayer's startPoint.x property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(StartPoint.X(0.5)
     let startPointX = myLayer.get(StartPoint.X.self)
     let startPointXDescriptor = Descriptor.Basic<StartPoint.X>.from(0, to: 1, duration: 1)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - GradientLayerProperty
    */
    public struct X: AnimatableGradientLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return StartPoint.keyPath.appendingKeyPath("x") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /**
     Wrapper for the CAGradientLayer's startPoint.y property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(StartPoint.Y(0.5)
     let startPointY = myLayer.get(StartPoint.Y.self)
     let startPointYDescriptor = Descriptor.Basic<StartPoint.Y>.from(0, to: 1, duration: 1)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - GradientLayerProperty
    */
    public struct Y: AnimatableGradientLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return StartPoint.keyPath.appendingKeyPath("y") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }
}
