//
//  ReplicatorPreservesDepth.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CAReplicatorLayer's preservesDepth property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: Bool

 ## Usage Examples ##
 ````
 myLayer.set(ReplicatorPreservesDepth(true))
 let preservesDepth = myLayer.get(ReplicatorPreservesDepth.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - ReplicatorLayerProperty
*/
public struct ReplicatorPreservesDepth: ReplicatorLayerPropertyConformance {
    public typealias KeyValueType = Bool

    public let value: KeyValueType?
    public static var keyPath: String { return "preservesDepth" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
