//
//  ContentsFormat.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's contentsFormat property
public struct ContentsFormat: UnsettableLayerPropertyConformance {
    // contentsFormat is documented as { get set } but setting appears to have no affect, so it's implemented here as read-only

    public typealias KeyValueType = CALayerContentsFormat

    public let value: KeyValueType?
    public static var keyPath: String { return "contentsFormat" }
}
