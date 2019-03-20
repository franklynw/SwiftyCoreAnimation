//
//  ShadowOpacity.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's shadowOpacity property
public struct ShadowOpacity: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "shadowOpacity" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
