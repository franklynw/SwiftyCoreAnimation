//
//  ShadowOffset.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's shadowOffset property, as CGSize

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGSize

 ## Usage Examples ##
 ````
 myLayer.set(ShadowOffset(CGSize(width: 50, height: 20)))
 let shadowOffsetSize = myLayer.get(ShadowOffset.self)
 let shadowOffsetSizeDescriptor = Descriptor.Basic<ShadowOffset>.from(.zero, to: CGSize(width: 50, height: 20), duration: 1)
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
public struct ShadowOffset: AnimatableLayerPropertyConformance {

    public typealias KeyValueType = CGSize

    public let value: KeyValueType?
    public static var keyPath: String { return "shadowOffset" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /**
     Wrapper for the CALayer's shadowOffset.width property, as CGFloat

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(ShadowOffset.Width(25))
     let offsetWidth = myLayer.get(ShadowOffset.Width.self)
     let offsetWidthDescriptor = Descriptor.Basic<ShadowOffset.Width>.from(16, to: 58, duration: 1)
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
    public struct Width: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return ShadowOffset.keyPath.appendingKeyPath("width") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }

    /**
     Wrapper for the CALayer's shadowOffset.height property, as CGFloat

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(ShadowOffset.Height(25))
     let offsetHeight = myLayer.get(ShadowOffset.Height.self)
     let offsetHeightDescriptor = Descriptor.Basic<ShadowOffset.Height>.from(16, to: 58, duration: 1)
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
    public struct Height: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return ShadowOffset.keyPath.appendingKeyPath("height") }

        public init(_ value: KeyValueType) {
            self.value = value
        }
    }
}
