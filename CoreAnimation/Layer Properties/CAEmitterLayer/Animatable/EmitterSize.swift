//
//  EmitterSize.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAEmitterLayer's emitterSize property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGSize

 ## Usage Examples ##
 ````
 myLayer.set(EmitterSize(CGSize(width: 20, height: 20)))
 let emitterSize = myLayer.get(EmitterSize.self)
 let emitterSizeDescriptor = Descriptor.Basic<EmitterSize>.from(CGSize(width: 0, height: 0), to: CGSize(width: 20, height: 20), duration: 5)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - EmitterLayerProperty
*/
public struct EmitterSize: AnimatableEmitterLayerPropertyConformance {

    public typealias KeyValueType = CGSize

    public let value: KeyValueType?
    public static var keyPath: String { return "emitterSize" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /**
     Wrapper for the CAEmitterLayer's emitterSize.width property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(EmitterSize.Width(50))
     let emitterWidth = myLayer.get(EmitterSize.Width.self)
     let emitterWidthDescriptor = Descriptor.Basic<EmitterSize.Width>.from(0, to: 300, duration: 5)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - EmitterLayerProperty
    */
    public struct Width: AnimatableEmitterLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return EmitterSize.keyPath.appendingKeyPath("width") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /**
     Wrapper for the CAEmitterLayer's emitterSize.height property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(EmitterSize.Height(100))
     let emitterHeight = myLayer.get(EmitterSize.Height.self)
     let emitterHeightDescriptor = Descriptor.Basic<EmitterSize.Height>.from(50, to: 400, duration: 5)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - EmitterLayerProperty
    */
    public struct Height: AnimatableEmitterLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return EmitterSize.keyPath.appendingKeyPath("height") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }
}
