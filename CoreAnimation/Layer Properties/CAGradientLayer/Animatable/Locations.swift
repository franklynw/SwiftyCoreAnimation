//
//  Locations.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAGradientLayer's locations property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: [CGFloat]

 ## Usage Examples ##
 ````
 myLayer.set(Locations([0, 0.2, 0.5, 1]))
 let locations = myLayer.get(Locations.self)
 let locationsDescriptor = Descriptor.Basic<Locations>.from([0, 0.2, 0.5, 1], to: [0, 0.6, 0.8, 1], duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - GradientLayerProperty
*/
public struct Locations: AnimatableGradientLayerPropertyConformance {
    public typealias KeyValueType = Array<CGFloat>

    public let value: KeyValueType?
    public static var keyPath: String { return "locations" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
