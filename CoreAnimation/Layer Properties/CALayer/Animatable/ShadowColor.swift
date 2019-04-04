//
//  ShadowColor.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's shadowColor property, as UIColor

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: UIColor

 ## Usage Examples ##
 ````
 myLayer.set(ShadowColor(.green))
 let shadowColor = myLayer.get(ShadowColor.self)
 let shadowColorDescriptor = Descriptor.Basic<ShadowColor>.from(.clear, to: .red, duration: 1)
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
public struct ShadowColor: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = UIColor

    public let value: KeyValueType?
    public static var keyPath: String { return "shadowColor" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /**
     Wrapper for the CALayer's shadowColor property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGColor

     ## Usage Examples ##
     ````
     myLayer.set(ShadowColor.CGColor(UIColor.green.cgColor))
     let shadowColor = myLayer.get(ShadowColor.CGColor.self)
     let shadowColorDescriptor = Descriptor.Basic<ShadowColor.CGColor>.from(UIColor.clear.cgColor, to: UIColor.red.cgColor, duration: 1)
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
    public struct CGColor: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = UIKit.CGColor

        public let value: KeyValueType?
        public static var keyPath: String { return ShadowColor.keyPath }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
