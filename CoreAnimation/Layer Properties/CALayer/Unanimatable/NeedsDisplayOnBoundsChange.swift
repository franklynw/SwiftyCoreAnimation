//
//  NeedsDisplayOnBoundsChange.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the layer's needsDisplayOnBoundsChange property
public struct NeedsDisplayOnBoundsChange: LayerPropertyConformance {
    public typealias KeyValueType = Bool

    public let value: KeyValueType?
    public static var keyPath: String { return "needsDisplayOnBoundsChange" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
