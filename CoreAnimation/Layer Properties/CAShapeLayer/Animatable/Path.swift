//
//  Path.swift
//  CoreAnimation
//
//  Created by Franklyn on 28/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAShapeLayer's path property, as UIBezierPath

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: UIBezierPath

 ## Usage Examples ##
 ````
 myLayer.set(Path(myPath))
 let path = myLayer.get(Path.self)
 let pathDescriptor = Descriptor.Basic<Path>.from(myPath, to: myOtherPath, duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - ShapeLayerProperty
*/
public struct Path: AnimatableShapeLayerPropertyConformance {
    public typealias KeyValueType = UIBezierPath

    public let value: KeyValueType?
    public static var keyPath: String { return "path" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /**
     Wrapper for the CAShapeLayer's path property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGPath

     ## Usage Examples ##
     ````
     myLayer.set(Path.CGPath(myCGPath))
     let path = myLayer.get(Path.CGPath.self)
     let pathDescriptor = Descriptor.Basic<Path.CGPath>.from(myCGPath, to: myOtherCGPath, duration: 1)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - ShapeLayerProperty
    */
    public struct CGPath: AnimatableShapeLayerPropertyConformance {
        public typealias KeyValueType = UIKit.CGPath

        public let value: KeyValueType?
        public static var keyPath: String { return "path" }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
