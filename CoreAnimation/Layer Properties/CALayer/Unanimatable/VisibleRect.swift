//
//  VisibleRect.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's visibleRect property

 Use with SwiftyCoreAnimation's get function
 - KeyValueType: CGRect

 ## Usage Examples ##
 ````
 let visibleRect = myLayer.get(VisibleRect.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - LayerProperty
 - ShapeLayerProperty
 - EmitterLayerProperty
 - GradientLayerProperty
 - ReplicatorLayerProperty
 - TextLayerProperty
*/
public struct VisibleRect: UnsettableLayerPropertyConformance {
    public typealias KeyValueType = CGRect

    public let value: KeyValueType?
    public static var keyPath: String { return "visibleRect" }
}
