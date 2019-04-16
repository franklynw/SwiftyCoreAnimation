//
//  ShadowPath.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's shadowPath property, as CGPath

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGPath

 ## Usage Examples ##
 ````
 myLayer.set(ShadowPath(myPath))
 let shadowPath = myLayer.get(ShadowPath.self)
 let shadowPathDescriptor = Descriptor.Basic<ShadowPath>.from(myPath, to: myOtherPath, duration: 1)
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
public struct ShadowPath: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = CGPath

    public let value: KeyValueType?
    public static var keyPath: String { return "shadowPath" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
