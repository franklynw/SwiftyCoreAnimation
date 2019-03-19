//
//  InstanceColor.swift
//  CoreAnimation
//
//  Created by Franklyn on 12/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the replicatorLayer's instanceColor property
public struct InstanceColor: AnimatableReplicatorLayerPropertyConformance {
    public typealias KeyValueType = UIColor

    public let value: KeyValueType?
    public static var keyPath: String { return "instanceColor" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /// Wrapper for the replicatorLayer's instanceColor property, but as CGColor
    public struct CGColor: AnimatableReplicatorLayerPropertyConformance {
        public typealias KeyValueType = UIKit.CGColor

        public let value: KeyValueType?
        public static var keyPath: String { return InstanceColor.keyPath }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
