//
//  FillColor.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAShapeLayer's fillColor property, as UIColor

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: UIColor

 ## Usage Examples ##
 ````
 myLayer.set(FillColor(.green))
 let fillColor = myLayer.get(FillColor.self)
 let fillColorDescriptor = Descriptor.Basic<FillColor>.from(.clear, to: .red, duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - ShapeLayerProperty
*/
public struct FillColor: AnimatableShapeLayerPropertyConformance {
    public typealias KeyValueType = UIColor

    public let value: KeyValueType?
    public static var keyPath: String { return "fillColor" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /**
     Wrapper for the CAShapeLayer's fillColor property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGColor

     ## Usage Examples ##
     ````
     myLayer.set(FillColor.CGColor(UIColor.green.cgColor))
     let fillColor = myLayer.get(FillColor.CGColor.self)
     let fillColorDescriptor = Descriptor.Basic<FillColor.CGColor>.from(UIColor.clear.cgColor, to: UIColor.red.cgColor, duration: 1)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - ShapeLayerProperty
    */
    public struct CGColor: AnimatableShapeLayerPropertyConformance {
        public typealias KeyValueType = UIKit.CGColor

        public let value: KeyValueType?
        public static var keyPath: String { return FillColor.keyPath }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
