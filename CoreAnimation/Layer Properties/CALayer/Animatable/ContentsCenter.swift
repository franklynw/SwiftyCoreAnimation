//
//  ContentsCenter.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's contentsCenter property, as CGRect

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGRect

 ## Usage Examples ##
 ````
 myLayer.set(ContentsCenter(CGRect(x: 10, y: 20, width: 50, height: 80)))
 let contentsCenter = myLayer.get(ContentsCenter.self)
 let contentsCenterDescriptor = Descriptor.Basic<ContentsCenter>.from(.zero, to: CGRect(x: 10, y: 20, width: 50, height: 80), duration: 1)
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
public struct ContentsCenter: AnimatableLayerPropertyConformance {

    public typealias KeyValueType = CGRect

    public let value: KeyValueType?
    public static var keyPath: String { return "contentsCenter" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /**
     Wrapper for the CALayer's contentsCenter.origin property, as CGPoint

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGPoint

     ## Usage Examples ##
     ````
     myLayer.set(ContentsCenter.Origin(CGPoint(x: 10, y: 20)))
     let contentsCenterOrigin = myLayer.get(ContentsCenter.Origin.self)
     let contentsCenterOriginDescriptor = Descriptor.Basic<ContentsCenter.Origin>.from(.zero, to: CGPoint(x: 10, y: 20), duration: 1)
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
        public static var keyPath: String { return ContentsCenter.keyPath.appendingKeyPath("origin") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /**
         Wrapper for the CALayer's contentsCenter.origin.x property, as CGFloat

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(ContentsCenter.Origin.X(12))
         let originX = myLayer.get(ContentsCenter.Origin.X.self)
         let originXDescriptor = Descriptor.Basic<ContentsCenter.Origin.X>.from(11, to: 52, duration: 1)
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
         Wrapper for the CALayer's contentsCenter.origin.y property, as CGFloat

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(ContentsCenter.Origin.Y(25))
         let originY = myLayer.get(ContentsCenter.Origin.Y.self)
         let originYDescriptor = Descriptor.Basic<ContentsCenter.Origin.Y>.from(16, to: 58, duration: 1)
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
     Wrapper for the CALayer's contentsCenter.size property, as CGSize

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGSize

     ## Usage Examples ##
     ````
     myLayer.set(ContentsCenter.Size(CGSize(width: 50, height: 20)))
     let contentsCenterSize = myLayer.get(ContentsCenter.Size.self)
     let contentsCenterSizeDescriptor = Descriptor.Basic<ContentsCenter.Size>.from(.zero, to: CGSize(width: 50, height: 20), duration: 1)
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
        public static var keyPath: String { return ContentsCenter.keyPath.appendingKeyPath("size") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /**
         Wrapper for the CALayer's contentsCenter.size.width property, as CGFloat

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(ContentsCenter.Size.Width(25))
         let sizeWidth = myLayer.get(ContentsCenter.Size.Width.self)
         let sizeWidthDescriptor = Descriptor.Basic<ContentsCenter.Size.Width>.from(16, to: 58, duration: 1)
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
         Wrapper for the CALayer's contentsCenter.size.height property, as CGFloat

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(ContentsCenter.Size.Height(25))
         let sizeHeight = myLayer.get(ContentsCenter.Size.Height.self)
         let sizeHeightDescriptor = Descriptor.Basic<ContentsCenter.Size.Height>.from(16, to: 58, duration: 1)
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
