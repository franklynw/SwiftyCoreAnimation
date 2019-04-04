//
//  InstanceColor.swift
//  CoreAnimation
//
//  Created by Franklyn on 12/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAReplicatorLayer's instanceColor property, as UIColor

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: UIColor

 ## Usage Examples ##
 ````
 myLayer.set(InstanceColor(.green))
 let instanceColor = myLayer.get(InstanceColor.self)
 let instanceColorDescriptor = Descriptor.Basic<InstanceColor>.from(.clear, to: .red, duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - ReplicatorLayerProperty
*/
public struct InstanceColor: AnimatableReplicatorLayerPropertyConformance {
    public typealias KeyValueType = UIColor

    public let value: KeyValueType?
    public static var keyPath: String { return "instanceColor" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /**
     Wrapper for the CAReplicatorLayer's instanceColor property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGColor

     ## Usage Examples ##
     ````
     myLayer.set(InstanceColor.CGColor(UIColor.green.cgColor))
     let instanceColor = myLayer.get(InstanceColor.CGColor.self)
     let instanceColorDescriptor = Descriptor.Basic<InstanceColor.CGColor>.from(UIColor.clear.cgColor, to: UIColor.red.cgColor, duration: 1)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - ReplicatorLayerProperty
    */
    public struct CGColor: AnimatableReplicatorLayerPropertyConformance {
        public typealias KeyValueType = UIKit.CGColor

        public let value: KeyValueType?
        public static var keyPath: String { return InstanceColor.keyPath }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
