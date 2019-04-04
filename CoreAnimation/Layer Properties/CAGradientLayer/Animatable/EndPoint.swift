//
//  EndPoint.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAGradientLayer's endPoint property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGPoint

 ## Usage Examples ##
 ````
 myLayer.set(EndPoint(CGPoint(x: 0.5, y: 0.5))
 let endPoint = myLayer.get(EndPoint.self)
 let endPointDescriptor = Descriptor.Basic<EndPoint>.from(.zero, to: CGPoint(x: 1, y: 1), duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - GradientLayerProperty
*/
public struct EndPoint: AnimatableGradientLayerPropertyConformance {
    public typealias KeyValueType = CGPoint

    public let value: KeyValueType?
    public static var keyPath: String { return "endPoint" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /**
     Wrapper for the CAGradientLayer's endPoint.x property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(EndPoint.X(0.5)
     let endPointX = myLayer.get(EndPoint.X.self)
     let endPointXDescriptor = Descriptor.Basic<EndPoint.X>.from(0, to: 1, duration: 1)
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
        public static var keyPath: String { return EndPoint.keyPath.appendingKeyPath("x") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /**
     Wrapper for the CAGradientLayer's endPoint.y property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(EndPoint.Y(0.5)
     let endPointY = myLayer.get(EndPoint.Y.self)
     let endPointYDescriptor = Descriptor.Basic<EndPoint.Y>.from(0, to: 1, duration: 1)
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
        public static var keyPath: String { return EndPoint.keyPath.appendingKeyPath("y") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }
}
