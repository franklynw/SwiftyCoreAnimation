//
//  EdgeAntialiasingMask.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's edgeAntialiasingMask property
public struct EdgeAntialiasingMask: LayerPropertyConformance {
    public typealias KeyValueType = CAEdgeAntialiasingMask

    public let value: KeyValueType?
    public static var keyPath: String { return "edgeAntialiasingMask" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
