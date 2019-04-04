//
//  InstanceRedOffset.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CAReplicatorLayer's instanceRedOffset property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: Float

 ## Usage Examples ##
 ````
 myLayer.set(InstanceRedOffset(0.7))
 let instanceRedOffset = myLayer.get(InstanceRedOffset.self)
 let instanceRedOffsetDescriptor = Descriptor.Basic<InstanceRedOffset>.from(0, to: 0.5, duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - ReplicatorLayerProperty
*/
public struct InstanceRedOffset: AnimatableReplicatorLayerPropertyConformance {
    public typealias KeyValueType = Float

    public let value: KeyValueType?
    public static var keyPath: String { return "instanceRedOffset" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
