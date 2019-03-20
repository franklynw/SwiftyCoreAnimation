//
//  Font.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the textLayer's font property
public struct Font: TextLayerPropertyConformance {
    public typealias KeyValueType = UIFont

    public let value: KeyValueType?
    public static var keyPath: String { return "font" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
