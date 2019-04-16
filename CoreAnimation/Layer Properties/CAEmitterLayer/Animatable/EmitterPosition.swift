//
//  EmitterPosition.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAEmitterLayer's emitterPosition property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGPoint

 ## Usage Examples ##
 ````
 myLayer.set(EmitterPosition(CGPoint(x: 100, y: 200)))
 let emitterPosition = myLayer.get(EmitterPosition.self)
 let emitterPositionDescriptor = Descriptor.Basic<EmitterPosition>.from(CGPoint(x: 100, y: 200), to: CGPoint(x: 100, y: 400), duration: 3)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - EmitterLayerProperty
*/
public struct EmitterPosition: AnimatableEmitterLayerPropertyConformance {

    public typealias KeyValueType = CGPoint // x & y

    public let value: KeyValueType?
    public static var keyPath: String { return "emitterPosition" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /**
     Wrapper for the CAEmitterLayer's emitterPosition.x property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(EmitterPosition.X(210))
     let emitterPosition = myLayer.get(EmitterPosition.X.self)
     let emitterPositionDescriptor = Descriptor.Basic<EmitterPosition.X>.from(0, to: 400, duration: 3)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - EmitterLayerProperty
    */
    public struct X: AnimatableEmitterLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return EmitterPosition.keyPath.appendingKeyPath("x") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /**
     Wrapper for the CAEmitterLayer's emitterPosition.y property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(EmitterPosition.Y(100))
     let emitterPositionY = myLayer.get(EmitterPosition.Y.self)
     let emitterPositionYDescriptor = Descriptor.Basic<EmitterPosition.Y>.from(0, to: 600, duration: 3)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - EmitterLayerProperty
    */
    public struct Y: AnimatableEmitterLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return EmitterPosition.keyPath.appendingKeyPath("y") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /**
     Wrapper for the CAEmitterLayer's emitterZPosition property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(EmitterPosition.Z(5))
     let emitterPositionZ = myLayer.get(EmitterPosition.Z.self)
     let emitterPositionZDescriptor = Descriptor.Basic<EmitterPosition.Z>.from(0, to: 50, duration: 3)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - EmitterLayerProperty
    */
    public struct Z: AnimatableEmitterLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return "emitterZPosition" }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }
}
