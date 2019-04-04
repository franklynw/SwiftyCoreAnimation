//
//  InstanceDelay.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAReplicatorLayer's instanceDelay property

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: TimeInterval

 ## Usage Examples ##
 ````
 myLayer.set(InstanceDelay(2))
 let instanceDelay = myLayer.get(InstanceDelay.self)
 let instanceDelayDescriptor = Descriptor.Basic<InstanceDelay>.from(0, to: 2, duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - ReplicatorLayerProperty
*/
public struct InstanceDelay: AnimatableReplicatorLayerPropertyConformance {
    public typealias KeyValueType = TimeInterval

    public let value: KeyValueType?
    public static var keyPath: String { return "instanceDelay" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
