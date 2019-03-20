//
//  InstanceBlueOffset.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the replicatorLayer's instanceBlueOffset property
public struct InstanceBlueOffset: AnimatableReplicatorLayerPropertyConformance {
    public typealias KeyValueType = Float

    public let value: KeyValueType?
    public static var keyPath: String { return "instanceBlueOffset" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
