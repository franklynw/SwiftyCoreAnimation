//
//  InstanceTransform.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAReplicatorLayer's instanceTransform property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CATransform3D

 ## Usage Examples ##
 ````
 myLayer.set(InstanceTransform(myTransform))
 let instanceTransform = myLayer.get(InstanceTransform.self)
 let instanceTransformDescriptor = Descriptor.Basic<InstanceTransform>.from(myTransform, to: myOtherTransform, duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - ReplicatorLayerProperty
*/
public struct InstanceTransform: AnimatableReplicatorLayerPropertyConformance {

    public typealias KeyValueType = CATransform3D

    public let value: KeyValueType?
    public static var keyPath: String { return "instanceTransform" }

    public init(_ value: KeyValueType) {
        self.value = value
    }

    /**
     Wrapper for the CAReplicatorLayer's instanceTransform.rotation property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(InstanceTransform.Rotation(CGFloat.pi))
     let rotation = myLayer.get(InstanceTransform.Rotation.self)
     let rotationDescriptor = Descriptor.Basic<InstanceTransform.Rotation>.from(0, to: CGFloat.pi, duration: 1)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - ReplicatorLayerProperty
    */
    public struct Rotation: AnimatableReplicatorLayerPropertyConformance {

        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return InstanceTransform.keyPath.appendingKeyPath("rotation") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /**
         Wrapper for the CAReplicatorLayer's instanceTransform.rotation.x property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(InstanceTransform.Rotation.X(CGFloat.pi))
         let rotation = myLayer.get(InstanceTransform.Rotation.X.self)
         let rotationDescriptor = Descriptor.Basic<InstanceTransform.Rotation.X>.from(0, to: CGFloat.pi, duration: 1)
         ````

         Conforms to -
         - Settable
         - Animatable
         - KeyValueProviding
         - ReplicatorLayerProperty
        */
        public struct X: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Rotation.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /**
         Wrapper for the CAReplicatorLayer's instanceTransform.rotation.y property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(InstanceTransform.Rotation.Y(CGFloat.pi))
         let rotation = myLayer.get(InstanceTransform.Rotation.Y.self)
         let rotationDescriptor = Descriptor.Basic<InstanceTransform.Rotation.Y>.from(0, to: CGFloat.pi, duration: 1)
         ````

         Conforms to -
         - Settable
         - Animatable
         - KeyValueProviding
         - ReplicatorLayerProperty
        */
        public struct Y: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Rotation.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /**
         Wrapper for the CAReplicatorLayer's instanceTransform.rotation.z property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(InstanceTransform.Rotation.Z(CGFloat.pi))
         let rotation = myLayer.get(InstanceTransform.Rotation.Z.self)
         let rotationDescriptor = Descriptor.Basic<InstanceTransform.Rotation.Z>.from(0, to: CGFloat.pi, duration: 1)
         ````

         Conforms to -
         - Settable
         - Animatable
         - KeyValueProviding
         - ReplicatorLayerProperty
        */
        public struct Z: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Rotation.keyPath.appendingKeyPath("z") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }

    /**
     Wrapper for the CAReplicatorLayer's instanceTransform.scale property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGFloat

     ## Usage Examples ##
     ````
     myLayer.set(InstanceTransform.Scale(0.5))
     let scale = myLayer.get(InstanceTransform.Scale.self)
     let scaleDescriptor = Descriptor.Basic<InstanceTransform.Scale>.from(0, to: 1, duration: 1)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - ReplicatorLayerProperty
    */
    public struct Scale: AnimatableReplicatorLayerPropertyConformance {

        public typealias KeyValueType = CGFloat

        public let value: KeyValueType?
        public static var keyPath: String { return InstanceTransform.keyPath.appendingKeyPath("scale") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /**
         Wrapper for the CAReplicatorLayer's instanceTransform.scale.x property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(InstanceTransform.Scale.X(0.5))
         let scale = myLayer.get(InstanceTransform.Scale.X.self)
         let scaleDescriptor = Descriptor.Basic<InstanceTransform.Scale.X>.from(0, to: 1, duration: 1)
         ````

         Conforms to -
         - Settable
         - Animatable
         - KeyValueProviding
         - ReplicatorLayerProperty
        */
        public struct X: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Scale.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /**
         Wrapper for the CAReplicatorLayer's instanceTransform.scale.y property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(InstanceTransform.Scale.Y(0.5))
         let scale = myLayer.get(InstanceTransform.Scale.Y.self)
         let scaleDescriptor = Descriptor.Basic<InstanceTransform.Scale.Y>.from(0, to: 1, duration: 1)
         ````

         Conforms to -
         - Settable
         - Animatable
         - KeyValueProviding
         - ReplicatorLayerProperty
        */
        public struct Y: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Scale.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /**
         Wrapper for the CAReplicatorLayer's instanceTransform.scale.z property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(InstanceTransform.Scale.Z(0.5))
         let scale = myLayer.get(InstanceTransform.Scale.Z.self)
         let scaleDescriptor = Descriptor.Basic<InstanceTransform.Scale.Z>.from(0, to: 1, duration: 1)
         ````

         Conforms to -
         - Settable
         - Animatable
         - KeyValueProviding
         - ReplicatorLayerProperty
        */
        public struct Z: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Scale.keyPath.appendingKeyPath("z") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }

    /**
     Wrapper for the CAReplicatorLayer's instanceTransform.translation property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGSize

     ## Usage Examples ##
     ````
     myLayer.set(InstanceTransform.Translation(CGSize(width: 50, height: 50))
     let translation = myLayer.get(InstanceTransform.Translation.self)
     let translationDescriptor = Descriptor.Basic<InstanceTransform.Translation>.from(.zero, to: CGSize(width: 50, height: 50), duration: 1)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - ReplicatorLayerProperty
    */
    public struct Translation: AnimatableReplicatorLayerPropertyConformance {

        public typealias KeyValueType = CGSize

        public let value: KeyValueType?
        public static var keyPath: String { return InstanceTransform.keyPath.appendingKeyPath("translation") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        /**
         Wrapper for the CAReplicatorLayer's instanceTransform.translation.x property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(InstanceTransform.Translation.X(50)
         let translation = myLayer.get(InstanceTransform.Translation.X.self)
         let translationDescriptor = Descriptor.Basic<InstanceTransform.Translation.X>.from(0, to: 50, duration: 1)
         ````

         Conforms to -
         - Settable
         - Animatable
         - KeyValueProviding
         - ReplicatorLayerProperty
        */
        public struct X: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Translation.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /**
         Wrapper for the CAReplicatorLayer's instanceTransform.translation.y property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(InstanceTransform.Translation.Y(50)
         let translation = myLayer.get(InstanceTransform.Translation.Y.self)
         let translationDescriptor = Descriptor.Basic<InstanceTransform.Translation.Y>.from(0, to: 50, duration: 1)
         ````

         Conforms to -
         - Settable
         - Animatable
         - KeyValueProviding
         - ReplicatorLayerProperty
        */
        public struct Y: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Translation.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        /**
         Wrapper for the CAReplicatorLayer's instanceTransform.translation.z property

         Use with Descriptors or SwiftyCoreAnimation's set/get functions
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         myLayer.set(InstanceTransform.Translation.Z(50)
         let translation = myLayer.get(InstanceTransform.Translation.Z.self)
         let translationDescriptor = Descriptor.Basic<InstanceTransform.Translation.Z>.from(0, to: 50, duration: 1)
         ````

         Conforms to -
         - Settable
         - Animatable
         - KeyValueProviding
         - ReplicatorLayerProperty
        */
        public struct Z: AnimatableReplicatorLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Translation.keyPath.appendingKeyPath("z") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }
}
