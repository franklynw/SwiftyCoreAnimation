//
//  MasksToBounds.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the layer's masksToBounds property
public struct MasksToBounds: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = Bool

    public let value: KeyValueType?
    public static var keyPath: String { return "masksToBounds" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
