//
//  SublayerTransform.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's sublayerTransform property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CATransform3D

 ## Usage Examples ##
 ````
 myLayer.set(SublayerTransform(myTransform3D))
 let sublayerTransform = myLayer.get(SublayerTransform.self)
 let sublayerTransformDescriptor = Descriptor.Basic<SublayerTransform>.from(myTransform3D, to: myOtherTransform3D, duration: 1)
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
public struct SublayerTransform: AnimatableLayerPropertyConformance {

    public typealias KeyValueType = CATransform3D

    public let value: KeyValueType?
    public static var keyPath: String { return "sublayerTransform" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /**
     Wrapper for the CALayer's sublayerTransform.rotation property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(SublayerTransform.Rotation(CGFloat.pi))
     let rotation = myLayer.get(SublayerTransform.Rotation.self)
     let rotationDescriptor = Descriptor.Basic<SublayerTransform.Rotation>.from(0, to: CGFloat.pi, duration: 1)
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
    public struct Rotation: AnimatableLayerPropertyConformance {

        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return SublayerTransform.keyPath.appendingKeyPath("rotation") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /**
         Wrapper for the CALayer's sublayerTransform.rotation.x property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(SublayerTransform.Rotation.X(CGFloat.pi))
         let rotation = myLayer.get(SublayerTransform.Rotation.X.self)
         let rotationDescriptor = Descriptor.Basic<SublayerTransform.Rotation.X>.from(0, to: CGFloat.pi, duration: 1)
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
            public static var keyPath: String { return Rotation.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /**
         Wrapper for the CALayer's sublayerTransform.rotation.y property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(SublayerTransform.Rotation.Y(CGFloat.pi))
         let rotation = myLayer.get(SublayerTransform.Rotation.Y.self)
         let rotationDescriptor = Descriptor.Basic<SublayerTransform.Rotation.Y>.from(0, to: CGFloat.pi, duration: 1)
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
            public static var keyPath: String { return Rotation.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /**
         Wrapper for the CALayer's sublayerTransform.rotation.z property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(SublayerTransform.Rotation.Z(CGFloat.pi))
         let rotation = myLayer.get(SublayerTransform.Rotation.Z.self)
         let rotationDescriptor = Descriptor.Basic<SublayerTransform.Rotation.Z>.from(0, to: CGFloat.pi, duration: 1)
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
            public static var keyPath: String { return Rotation.keyPath.appendingKeyPath("z") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }

    /**
     Wrapper for the CALayer's sublayerTransform.scale property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(SublayerTransform.Scale(0.1))
     let scale = myLayer.get(SublayerTransform.Scale.self)
     let scaleDescriptor = Descriptor.Basic<SublayerTransform.Scale>.from(0.1, to: 2.5, duration: 1)
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
    public struct Scale: AnimatableLayerPropertyConformance {

        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return SublayerTransform.keyPath.appendingKeyPath("scale") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /**
         Wrapper for the CALayer's sublayerTransform.scale.x property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(SublayerTransform.Scale.X(0.1))
         let scale = myLayer.get(SublayerTransform.Scale.X.self)
         let scaleDescriptor = Descriptor.Basic<SublayerTransform.Scale.X>.from(0.1, to: 2.5, duration: 1)
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
            public static var keyPath: String { return Scale.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /**
         Wrapper for the CALayer's sublayerTransform.scale.y property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(SublayerTransform.Scale.Y(0.1))
         let scale = myLayer.get(SublayerTransform.Scale.Y.self)
         let scaleDescriptor = Descriptor.Basic<SublayerTransform.Scale.Y>.from(0.1, to: 2.5, duration: 1)
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
            public static var keyPath: String { return Scale.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /**
         Wrapper for the CALayer's sublayerTransform.scale.z property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(SublayerTransform.Scale.Z(0.1))
         let scale = myLayer.get(SublayerTransform.Scale.Z.self)
         let scaleDescriptor = Descriptor.Basic<SublayerTransform.Scale.Z>.from(0.1, to: 2.5, duration: 1)
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
            public static var keyPath: String { return Scale.keyPath.appendingKeyPath("z") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }

    /**
     Wrapper for the CALayer's sublayerTransform.translation property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGSize

     ## Usage Examples ##
     ````
     myLayer.set(SublayerTransform.Translation(CGSize(width: 50, height: 20)))
     let translation = myLayer.get(SublayerTransform.Translation.self)
     let translationDescriptor = Descriptor.Basic<SublayerTransform.Translation>.from(.zero, to: CGSize(width: 50, height: 20), duration: 1)
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
    public struct Translation: AnimatableLayerPropertyConformance {

        public typealias KeyValueType = CGSize

        public let value: KeyValueType?
        public static var keyPath: String { return SublayerTransform.keyPath.appendingKeyPath("translation") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /**
         Wrapper for the CALayer's sublayerTransform.translation.x property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGSize

         ## Usage Examples ##
         ````
         myLayer.set(SublayerTransform.Translation.X(CGSize(width: 50, height: 20)))
         let translation = myLayer.get(SublayerTransform.Translation.X.self)
         let translationDescriptor = Descriptor.Basic<SublayerTransform.Translation.X>.from(.zero, to: CGSize(width: 50, height: 20), duration: 1)
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
            public static var keyPath: String { return Translation.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /**
         Wrapper for the CALayer's sublayerTransform.translation.y property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGSize

         ## Usage Examples ##
         ````
         myLayer.set(SublayerTransform.Translation.Y(CGSize(width: 50, height: 20)))
         let translation = myLayer.get(SublayerTransform.Translation.Y.self)
         let translationDescriptor = Descriptor.Basic<SublayerTransform.Translation.Y>.from(.zero, to: CGSize(width: 50, height: 20), duration: 1)
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
            public static var keyPath: String { return Translation.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /**
         Wrapper for the CALayer's sublayerTransform.translation.z property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGSize

         ## Usage Examples ##
         ````
         myLayer.set(SublayerTransform.Translation.Z(CGSize(width: 50, height: 20)))
         let translation = myLayer.get(SublayerTransform.Translation.Z.self)
         let translationDescriptor = Descriptor.Basic<SublayerTransform.Translation.Z>.from(.zero, to: CGSize(width: 50, height: 20), duration: 1)
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
            public static var keyPath: String { return Translation.keyPath.appendingKeyPath("z") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }
}
