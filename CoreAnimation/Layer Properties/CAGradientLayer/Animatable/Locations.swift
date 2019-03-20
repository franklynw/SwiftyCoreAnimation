//
//  Locations.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the gradientLayer's locations property
public struct Locations: AnimatableGradientLayerPropertyConformance {
    public typealias KeyValueType = Array<CGFloat>

    public let value: KeyValueType?
    public static var keyPath: String { return "locations" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
