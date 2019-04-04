//
//  InstanceAlphaOffset.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CAReplicatorLayer's instanceAlphaOffset property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: Float

 ## Usage Examples ##
 ````
 myLayer.set(InstanceAlphaOffset(0.7))
 let instanceAlphaOffset = myLayer.get(InstanceAlphaOffset.self)
 let instanceAlphaOffsetDescriptor = Descriptor.Basic<InstanceAlphaOffset>.from(0, to: 0.5, duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - ReplicatorLayerProperty
*/
public struct InstanceAlphaOffset: AnimatableReplicatorLayerPropertyConformance {
    public typealias KeyValueType = Float

    public let value: KeyValueType?
    public static var keyPath: String { return "instanceAlphaOffset" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
