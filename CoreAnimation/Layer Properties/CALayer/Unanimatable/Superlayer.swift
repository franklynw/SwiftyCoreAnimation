//
//  Superlayer.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's superlayer property
public struct Superlayer: UnsettableLayerPropertyConformance {
    public typealias KeyValueType = CALayer

    public let value: KeyValueType?
    public static var keyPath: String { return "superlayer" }
}
