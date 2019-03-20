//
//  ShadowPath.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's shadowPath property
public struct ShadowPath: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = CGPath

    public let value: KeyValueType?
    public static var keyPath: String { return "shadowPath" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
