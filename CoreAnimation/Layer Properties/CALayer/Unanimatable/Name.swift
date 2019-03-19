//
//  Name.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the layer's name property
public struct Name: LayerPropertyConformance {
    public typealias KeyValueType = String

    public let value: KeyValueType?
    public static var keyPath: String { return "name" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
