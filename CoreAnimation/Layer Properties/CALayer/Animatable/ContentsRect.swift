//
//  ContentsRect.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's contentsRect property, as CGRect

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGRect

 ## Usage Examples ##
 ````
 myLayer.set(ContentsRect(CGRect(x: 10, y: 20, width: 50, height: 80)))
 let contentsRect = myLayer.get(ContentsRect.self)
 let contentsRectDescriptor = Descriptor.Basic<ContentsRect>.from(.zero, to: CGRect(x: 10, y: 20, width: 50, height: 80), duration: 1)
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
public struct ContentsRect: AnimatableLayerPropertyConformance {

    public typealias KeyValueType = CGRect

    public let value: KeyValueType?
    public static var keyPath: String { return "contentsRect" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /**
     Wrapper for the CALayer's contentsRect.origin property, as CGPoint

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGPoint

     ## Usage Examples ##
     ````
     myLayer.set(ContentsRect.Origin(CGPoint(x: 10, y: 20)))
     let contentsRectOrigin = myLayer.get(ContentsRect.Origin.self)
     let contentsRectOriginDescriptor = Descriptor.Basic<ContentsRect.Origin>.from(.zero, to: CGPoint(x: 10, y: 20), duration: 1)
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
        public static var keyPath: String { return ContentsRect.keyPath.appendingKeyPath("origin") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /**
         Wrapper for the CALayer's contentsRect.origin.x property, as CGFloat

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(ContentsRect.Origin.X(12))
         let originX = myLayer.get(ContentsRect.Origin.X.self)
         let originXDescriptor = Descriptor.Basic<ContentsRect.Origin.X>.from(11, to: 52, duration: 1)
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
         Wrapper for the CALayer's contentsRect.origin.y property, as CGFloat

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(ContentsRect.Origin.Y(12))
         let originY = myLayer.get(ContentsRect.Origin.Y.self)
         let originYDescriptor = Descriptor.Basic<ContentsRect.Origin.Y>.from(11, to: 52, duration: 1)
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
     Wrapper for the CALayer's contentsRect.size property, as CGSize

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGSize

     ## Usage Examples ##
     ````
     myLayer.set(ContentsRect.Size(CGSize(width: 50, height: 20)))
     let contentsRectSize = myLayer.get(ContentsRect.Size.self)
     let contentsRectSizeDescriptor = Descriptor.Basic<ContentsRect.Size>.from(.zero, to: CGSize(width: 50, height: 20), duration: 1)
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
        public static var keyPath: String { return ContentsRect.keyPath.appendingKeyPath("size") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /**
         Wrapper for the CALayer's contentsRect.size.width property, as CGFloat

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(ContentsRect.Size.Width(25))
         let sizeWidth = myLayer.get(ContentsRect.Size.Width.self)
         let sizeWidthDescriptor = Descriptor.Basic<ContentsRect.Size.Width>.from(16, to: 58, duration: 1)
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
         Wrapper for the CALayer's contentsRect.size.height property, as CGFloat

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(ContentsRect.Size.Height(25))
         let sizeHeight = myLayer.get(ContentsRect.Size.Height.self)
         let sizeHeightDescriptor = Descriptor.Basic<ContentsRect.Size.Height>.from(16, to: 58, duration: 1)
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
