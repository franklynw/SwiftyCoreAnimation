//
//  Transform.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's transform property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CATransform3D

 ## Usage Examples ##
 ````
 myLayer.set(Transform(myTransform3D))
 let transform = myLayer.get(Transform.self)
 let transformDescriptor = Descriptor.Basic<Transform>.from(myTransform3D, to: myOtherTransform3D, duration: 1)
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
public struct Transform: AnimatableLayerPropertyConformance {

    public typealias KeyValueType = CATransform3D

    public let value: KeyValueType?
    public static var keyPath: String { return "transform" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /**
     Wrapper for the CALayer's transform.rotation property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(Transform.Rotation(CGFloat.pi))
     let rotation = myLayer.get(Transform.Rotation.self)
     let rotationDescriptor = Descriptor.Basic<Transform.Rotation>.from(0, to: CGFloat.pi, duration: 1)
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
        public static var keyPath: String { return Transform.keyPath.appendingKeyPath("rotation") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /**
         Wrapper for the CALayer's transform.rotation.x property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(Transform.Rotation.X(CGFloat.pi))
         let rotation = myLayer.get(Transform.Rotation.X.self)
         let rotationDescriptor = Descriptor.Basic<Transform.Rotation.X>.from(0, to: CGFloat.pi, duration: 1)
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
         Wrapper for the CALayer's transform.rotation.y property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(Transform.Rotation.Y(CGFloat.pi))
         let rotation = myLayer.get(Transform.Rotation.Y.self)
         let rotationDescriptor = Descriptor.Basic<Transform.Rotation.Y>.from(0, to: CGFloat.pi, duration: 1)
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
         Wrapper for the CALayer's transform.rotation.z property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(Transform.Rotation.Z(CGFloat.pi))
         let rotation = myLayer.get(Transform.Rotation.Z.self)
         let rotationDescriptor = Descriptor.Basic<Transform.Rotation.Z>.from(0, to: CGFloat.pi, duration: 1)
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
     Wrapper for the CALayer's transform.scale property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(Transform.Scale(0.1))
     let scale = myLayer.get(Transform.Scale.self)
     let scaleDescriptor = Descriptor.Basic<Transform.Scale>.from(0.1, to: 2.5, duration: 1)
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
        public static var keyPath: String { return Transform.keyPath.appendingKeyPath("scale") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /**
         Wrapper for the CALayer's transform.scale.x property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(Transform.Scale.X(0.1))
         let scale = myLayer.get(Transform.Scale.X.self)
         let scaleDescriptor = Descriptor.Basic<Transform.Scale.X>.from(0.1, to: 2.5, duration: 1)
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
         Wrapper for the CALayer's transform.scale.y property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(Transform.Scale.Y(0.1))
         let scale = myLayer.get(Transform.Scale.Y.self)
         let scaleDescriptor = Descriptor.Basic<Transform.Scale.Y>.from(0.1, to: 2.5, duration: 1)
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
         Wrapper for the CALayer's transform.scale.z property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(Transform.Scale.Z(0.1))
         let scale = myLayer.get(Transform.Scale.Z.self)
         let scaleDescriptor = Descriptor.Basic<Transform.Scale.Z>.from(0.1, to: 2.5, duration: 1)
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
     Wrapper for the CALayer's transform.translation property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGSize

     ## Usage Examples ##
     ````
     myLayer.set(Transform.Translation(CGSize(width: 50, height: 20)))
     let translation = myLayer.get(Transform.Translation.self)
     let translationDescriptor = Descriptor.Basic<Transform.Translation>.from(.zero, to: CGSize(width: 50, height: 20), duration: 1)
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
        public static var keyPath: String { return Transform.keyPath.appendingKeyPath("translation") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /**
         Wrapper for the CALayer's transform.translation.x property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGSize

         ## Usage Examples ##
         ````
         myLayer.set(Transform.Translation.X(CGSize(width: 50, height: 20)))
         let translation = myLayer.get(Transform.Translation.X.self)
         let translationDescriptor = Descriptor.Basic<Transform.Translation.X>.from(.zero, to: CGSize(width: 50, height: 20), duration: 1)
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
         Wrapper for the CALayer's transform.translation.y property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGSize

         ## Usage Examples ##
         ````
         myLayer.set(Transform.Translation.Y(CGSize(width: 50, height: 20)))
         let translation = myLayer.get(Transform.Translation.Y.self)
         let translationDescriptor = Descriptor.Basic<Transform.Translation.Y>.from(.zero, to: CGSize(width: 50, height: 20), duration: 1)
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
         Wrapper for the CALayer's transform.translation.z property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGSize

         ## Usage Examples ##
         ````
         myLayer.set(Transform.Translation.Z(CGSize(width: 50, height: 20)))
         let translation = myLayer.get(Transform.Translation.Z.self)
         let translationDescriptor = Descriptor.Basic<Transform.Translation.Z>.from(.zero, to: CGSize(width: 50, height: 20), duration: 1)
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
