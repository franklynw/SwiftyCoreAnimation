//
//  Position.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's position property, as CGPoint

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGPoint

 ## Usage Examples ##
 ````
 myLayer.set(Position(CGPoint(x: 10, y: 20)))
 let position = myLayer.get(Position.self)
 let positionDescriptor = Descriptor.Basic<Position>.from(.zero, to: CGPoint(x: 10, y: 20), duration: 1)
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
public struct Position: AnimatableLayerPropertyConformance {

    public typealias KeyValueType = CGPoint // x & y

    public let value: KeyValueType?
    public static var keyPath: String { return "position" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /**
     Wrapper for the CALayer's position.x property, as CGFloat

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(Position.X(20))
     let positionX = myLayer.get(Position.X.self)
     let positionXDescriptor = Descriptor.Basic<Position.X>.from(10, to: 50, duration: 1)
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
        public static var keyPath: String { return Position.keyPath.appendingKeyPath("x") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /**
     Wrapper for the CALayer's position.y property, as CGFloat

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(Position.Y(20))
     let positionY = myLayer.get(Position.Y.self)
     let positionYDescriptor = Descriptor.Basic<Position.Y>.from(10, to: 50, duration: 1)
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
        public static var keyPath: String { return Position.keyPath.appendingKeyPath("y") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /**
     Wrapper for the CALayer's zPosition property, as CGFloat

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(Position.Z(20))
     let positionZ = myLayer.get(Position.Z.self)
     let positionZDescriptor = Descriptor.Basic<Position.Z>.from(10, to: 50, duration: 1)
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
        public static var keyPath: String { return "zPosition" }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }
}
