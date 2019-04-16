//
//  BackgroundColor.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's backgroundColor property, as UIColor

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: UIColor

 ## Usage Examples ##
 ````
 myLayer.set(BackgroundColor(.green))
 let backgroundColor = myLayer.get(BackgroundColor.self)
 let backgroundColorDescriptor = Descriptor.Basic<BackgroundColor>.from(.clear, to: .red, duration: 1)
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
public struct BackgroundColor: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = UIColor

    public let value: KeyValueType?
    public static var keyPath: String { return "backgroundColor" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /**
     Wrapper for the CALayer's backgroundColor property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGColor

     ## Usage Examples ##
     ````
     myLayer.set(BackgroundColor.CGColor(UIColor.green.cgColor))
     let backgroundColor = myLayer.get(BackgroundColor.CGColor.self)
     let backgroundColorDescriptor = Descriptor.Basic<BackgroundColor.CGColor>.from(UIColor.clear.cgColor, to: UIColor.red.cgColor, duration: 1)
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
        public static var keyPath: String { return BackgroundColor.keyPath }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
