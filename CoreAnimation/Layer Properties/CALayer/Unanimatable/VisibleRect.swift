//
//  VisibleRect.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's visibleRect property
public struct VisibleRect: UnsettableLayerPropertyConformance {
    public typealias KeyValueType = CGRect

    public let value: KeyValueType?
    public static var keyPath: String { return "visibleRect" }
}
