//
//  ForegroundColor.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the textLayer's foregroundColor property
public struct ForegroundColor: AnimatableTextLayerPropertyConformance {
    public typealias KeyValueType = UIColor

    public let value: KeyValueType?
    public static var keyPath: String { return "foregroundColor" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /// Wrapper for the textLayer's foregroundColor property, but as CGColor
    public struct CGColor: AnimatableTextLayerPropertyConformance {
        public typealias KeyValueType = UIKit.CGColor

        public let value: KeyValueType?
        public static var keyPath: String { return ForegroundColor.keyPath }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
