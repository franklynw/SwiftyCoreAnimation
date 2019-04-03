//
//  Contents.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's contents property, as UIImage

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGRect

 ## Usage Examples ##
 ````
 myLayer.set(Contents(UIImage(named: "myImage")))
 let image = myLayer.get(Contents.self)
 let imageDescriptor = Descriptor.Basic<Contents>.from(UIImage(named: "myImage1"), to: UIImage(named: "myImage2"), duration: 1)
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
public struct Contents: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = UIImage

    public let value: KeyValueType?
    public static var keyPath: String { return "contents" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /// Wrapper for the layer's contents property, but as CGColor
    public struct CGImage: AnimatableLayerPropertyConformance {
        public typealias KeyValueType = UIKit.CGImage

        public let value: KeyValueType?
        public static var keyPath: String { return Contents.keyPath }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
