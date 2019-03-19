//
//  ReplicatorPreservesDepth.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the replicatorLayer's preservesDepth property
public struct ReplicatorPreservesDepth: ReplicatorLayerPropertyConformance {
    public typealias KeyValueType = Bool

    public let value: KeyValueType?
    public static var keyPath: String { return "preservesDepth" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
