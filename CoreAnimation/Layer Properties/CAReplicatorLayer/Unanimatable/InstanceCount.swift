//
//  InstanceCount.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the replicatorLayer's instanceCount property
public struct InstanceCount: ReplicatorLayerPropertyConformance {
    public typealias KeyValueType = Int

    public let value: KeyValueType?
    public static var keyPath: String { return "instanceCount" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
