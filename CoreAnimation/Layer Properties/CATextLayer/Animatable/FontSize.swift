//
//  FontSize.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the textLayer's fontSize property
public struct FontSize: AnimatableTextLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "fontSize" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
