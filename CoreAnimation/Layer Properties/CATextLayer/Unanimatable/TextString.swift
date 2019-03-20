//
//  TextString.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the textLayer's string property
public struct TextString: TextLayerPropertyConformance {
    public typealias KeyValueType = String

    public let value: KeyValueType?
    public static var keyPath: String { return "string" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
