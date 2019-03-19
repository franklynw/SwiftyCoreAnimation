//
//  ContentsScale.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's contentsScale property
public struct ContentsScale: LayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "contentsScale" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
