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

    public struct Origin: UnsettableLayerPropertyConformance {
        public typealias KeyValueType = CGPoint

        public let value: KeyValueType?
        public static var keyPath: String { return VisibleRect.keyPath.appendingKeyPath("origin") }

        public struct X: UnsettableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Origin.keyPath.appendingKeyPath("x") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        public struct Y: UnsettableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Origin.keyPath.appendingKeyPath("y") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }

    public struct Size: UnsettableLayerPropertyConformance {
        public typealias KeyValueType = CGSize

        public let value: KeyValueType?
        public static var keyPath: String { return VisibleRect.keyPath.appendingKeyPath("size") }

        public init(_ value: KeyValueType) {
            self.value = value
        }

        public struct Width: UnsettableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Size.keyPath.appendingKeyPath("width") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }

        public struct Height: UnsettableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Size.keyPath.appendingKeyPath("height") }

            public init(_ value: KeyValueType) {
                self.value = value
            }
        }
    }
}
