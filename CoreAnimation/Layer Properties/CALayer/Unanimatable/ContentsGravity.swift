//
//  ContentsGravity.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's contentsGravity property
public struct ContentsGravity: LayerPropertyConformance {
    public typealias KeyValueType = CALayerContentsGravity

    public let value: KeyValueType?
    public static var keyPath: String { return "contentsGravity" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
