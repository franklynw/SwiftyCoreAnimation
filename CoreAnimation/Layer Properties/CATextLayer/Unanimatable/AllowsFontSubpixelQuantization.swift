//
//  AllowsFontSubpixelQuantization.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/// Wrapper for the textLayer's allowsFontSubpixelQuantization property
public struct AllowsFontSubpixelQuantization: TextLayerPropertyConformance {
    public typealias KeyValueType = Bool

    public let value: KeyValueType?
    public static var keyPath: String { return "allowsFontSubpixelQuantization" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
