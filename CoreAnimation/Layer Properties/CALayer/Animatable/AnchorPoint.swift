//
//  AnchorPoint.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's anchorPoint property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGPoint

 ## Usage Examples ##
 ````
 myLayer.set(AnchorPoint(.zero))
 let anchorPoint = myLayer.get(AnchorPoint.self)
 let anchorPointDescriptor = Descriptor.Basic<AnchorPoint>.from(.zero, to: CGPoint(x: 1, y: 1), duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - LayerProperty
 - ShapeLayerProperty
 - EmitterLayerProperty
 - GradientLayerProperty
 - ReplicatorLayerProperty
 - TextLayerProperty
*/
public struct AnchorPoint: AnimatableLayerPropertyConformance {
    
    public typealias KeyValueType = CGPoint

    public let value: KeyValueType?
    public static var keyPath: String { return "anchorPoint" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /**
     Wrapper for the CALayer's anchorPoint.x property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(AnchorPoint.X(0))
     let anchorPointX = myLayer.get(AnchorPoint.X.self)
     let anchorPointXDescriptor = Descriptor.Basic<AnchorPoint.X>.from(0, to: 1, duration: 1)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - LayerProperty
     - ShapeLayerProperty
     - EmitterLayerProperty
     - GradientLayerProperty
     - ReplicatorLayerProperty
     - TextLayerProperty
    */
    public struct X: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return AnchorPoint.keyPath.appendingKeyPath("x") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /**
     Wrapper for the CALayer's anchorPoint.y property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(AnchorPoint.Y(0))
     let anchorPointY = myLayer.get(AnchorPoint.Y.self)
     let anchorPointYDescriptor = Descriptor.Basic<AnchorPoint.Y>.from(0, to: 1, duration: 1)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - LayerProperty
     - ShapeLayerProperty
     - EmitterLayerProperty
     - GradientLayerProperty
     - ReplicatorLayerProperty
     - TextLayerProperty
    */
    public struct Y: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return AnchorPoint.keyPath.appendingKeyPath("y") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /**
     Wrapper for the CALayer's anchorPointZ property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(AnchorPoint.Z(0))
     let anchorPointZ = myLayer.get(AnchorPoint.Z.self)
     let anchorPointZDescriptor = Descriptor.Basic<AnchorPoint.Z>.from(0, to: 1, duration: 1)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - LayerProperty
     - ShapeLayerProperty
     - EmitterLayerProperty
     - GradientLayerProperty
     - ReplicatorLayerProperty
     - TextLayerProperty
    */
    public struct Z: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return "anchorPointZ" }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }
}
