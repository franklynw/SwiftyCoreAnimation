//
//  Opaque.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the layer's isOpaque property
public struct Opaque: LayerPropertyConformance {
    public typealias KeyValueType = Bool

    public let value: KeyValueType?
    public static var keyPath: String { return "opaque" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
