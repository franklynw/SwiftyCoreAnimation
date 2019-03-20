//
//  BorderWidth.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's borderWidth property
public struct BorderWidth: AnimatableLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "borderWidth" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
