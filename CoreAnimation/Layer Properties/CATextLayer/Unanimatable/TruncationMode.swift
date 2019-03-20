//
//  TruncationMode.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the textLayer's truncationMode property
public struct TruncationMode: TextLayerPropertyConformance {
    public typealias KeyValueType = CATextLayerTruncationMode

    public let value: KeyValueType?
    public static var keyPath: String { return "truncationMode" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
