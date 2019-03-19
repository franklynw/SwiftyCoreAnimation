//
//  Actions.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the layer's actions property
public struct Actions: LayerPropertyConformance {
    public typealias KeyValueType = [String: CAAction]

    public let value: KeyValueType?
    public static var keyPath: String { return "actions" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
