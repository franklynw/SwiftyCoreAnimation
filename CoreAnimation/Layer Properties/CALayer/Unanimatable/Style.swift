//
//  Style.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the layer's style property
public struct Style: LayerPropertyConformance {
    public typealias KeyValueType = [AnyHashable: Any]

    public let value: KeyValueType?
    public static var keyPath: String { return "style" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
