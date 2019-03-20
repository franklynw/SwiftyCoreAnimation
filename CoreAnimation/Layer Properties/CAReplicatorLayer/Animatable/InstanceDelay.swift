//
//  InstanceDelay.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the replicatorLayer's instanceDelay property
public struct InstanceDelay: AnimatableReplicatorLayerPropertyConformance {
    public typealias KeyValueType = TimeInterval

    public let value: KeyValueType?
    public static var keyPath: String { return "instanceDelay" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
