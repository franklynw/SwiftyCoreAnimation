//
//  AlignmentMode.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the textLayer's alignmentMode property
public struct AlignmentMode: TextLayerPropertyConformance {
    public typealias KeyValueType = CATextLayerAlignmentMode

    public let value: KeyValueType?
    public static var keyPath: String { return "alignmentMode" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
