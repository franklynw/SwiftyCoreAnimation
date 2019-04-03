//
//  Bounds.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's bounds property, as CGRect

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGRect

 ## Usage Examples ##
 ````
 myLayer.set(Bounds(CGRect(x: 10, y: 20, width: 50, height: 80)))
 let bounds = myLayer.get(Bounds.self)
 let boundsDescriptor = Descriptor.Basic<Bounds>.from(.zero, to: CGRect(x: 10, y: 20, width: 50, height: 80), duration: 1)
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
public struct Bounds: AnimatableLayerPropertyConformance {

    public typealias KeyValueType = CGRect

    public let value: KeyValueType?
    public static var keyPath: String { return "bounds" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /**
     Wrapper for the CALayer's bounds.origin property, as CGPoint

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGPoint

     ## Usage Examples ##
     ````
     myLayer.set(Bounds.Origin(CGPoint(x: 10, y: 20)))
     let boundsOrigin = myLayer.get(Bounds.Origin.self)
     let boundsOriginDescriptor = Descriptor.Basic<Bounds.Origin>.from(.zero, to: CGPoint(x: 10, y: 20), duration: 1)
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
    public struct Origin: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGPoint

        public let value: KeyValueType?
        public static var keyPath: String { return Bounds.keyPath.appendingKeyPath("origin") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /**
         Wrapper for the CALayer's bounds.origin.x property, as CGFloat

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(Bounds.Origin.X(25))
         let boundsOriginX = myLayer.get(Bounds.Origin.X.self)
         let boundsOriginXDescriptor = Descriptor.Basic<Bounds.Origin.X>.from(16, to: 58, duration: 1)
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
            public static var keyPath: String { return Origin.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /**
         Wrapper for the CALayer's bounds.origin.y property, as CGFloat

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(Bounds.Origin.Y(25))
         let boundsOriginY = myLayer.get(Bounds.Origin.Y.self)
         let boundsOriginYDescriptor = Descriptor.Basic<Bounds.Origin.Y>.from(16, to: 58, duration: 1)
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
            public static var keyPath: String { return Origin.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }

    /**
     Wrapper for the CALayer's bounds.size property, as CGSize

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGSize

     ## Usage Examples ##
     ````
     myLayer.set(Bounds.Size(CGSize(width: 50, height: 20)))
     let boundsSize = myLayer.get(Bounds.Size.self)
     let boundsSizeDescriptor = Descriptor.Basic<Bounds.Size>.from(.zero, to: CGSize(width: 50, height: 20), duration: 1)
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
    public struct Size: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = CGSize

        public let value: KeyValueType?
        public static var keyPath: String { return Bounds.keyPath.appendingKeyPath("size") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /**
         Wrapper for the CALayer's bounds.size.width property, as CGFloat

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(Bounds.Size.Width(25))
         let boundsWidth = myLayer.get(Bounds.Size.Width.self)
         let boundsWidthDescriptor = Descriptor.Basic<Bounds.Size.Width>.from(16, to: 58, duration: 1)
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
            public static var keyPath: String { return Size.keyPath.appendingKeyPath("width") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /**
         Wrapper for the CALayer's bounds.size.height property, as CGFloat

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(Bounds.Size.Height(25))
         let boundsHeight = myLayer.get(Bounds.Size.Height.self)
         let boundsHeightDescriptor = Descriptor.Basic<Bounds.Size.Height>.from(16, to: 58, duration: 1)
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
            public static var keyPath: String { return Size.keyPath.appendingKeyPath("height") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }
}
