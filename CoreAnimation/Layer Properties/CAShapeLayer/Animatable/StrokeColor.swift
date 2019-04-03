//
//  StrokeColor.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAShapeLayer's strokeColor property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: UIColor

 ## Usage Examples ##
 ````
 myLayer.set(StrokeColor(.green))
 let strokeColor = myLayer.get(StrokeColor.self)
 let strokeColorDescriptor = Descriptor.Basic<StrokeColor>.from(.clear, to: .red, duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - ShapeLayerProperty
*/
public struct StrokeColor: AnimatableShapeLayerPropertyConformance {
    public typealias KeyValueType = UIColor

    public let value: KeyValueType?
    public static var keyPath: String { return "strokeColor" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /**
     Wrapper for the CAShapeLayer's strokeColor property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGColor

     ## Usage Examples ##
     ````
     myLayer.set(StrokeColor.CGColor(UIColor.green.cgColor))
     let strokeColor = myLayer.get(StrokeColor.CGColor.self)
     let strokeColorDescriptor = Descriptor.Basic<StrokeColor.CGColor>.from(UIColor.clear.cgColor, to: UIColor.red.cgColor, duration: 1)
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
        public static var keyPath: String { return StrokeColor.keyPath }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
