//
//  GradientType.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAGradientLayer's type property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: CAGradientLayerType

 ## Usage Examples ##
 ````
 myLayer.set(GradientType(.radial))
 let gradientType = myLayer.get(GradientType.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - GradientLayerProperty
*/
@available(iOS 12.0, *)
public struct GradientType: GradientLayerPropertyConformance {
    public typealias KeyValueType = CAGradientLayerType

    public let value: KeyValueType?
    public static var keyPath: String { return "type" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
