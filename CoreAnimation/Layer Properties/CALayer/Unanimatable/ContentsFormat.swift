//
//  ContentsFormat.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's contentsFormat property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: Bool

 ## Usage Examples ##
 ````
 let contentsFormat = myLayer.get(ContentsFormat.self)
 ````

 Conforms to -
 - KeyValueProviding
 - LayerProperty
 - ShapeLayerProperty
 - EmitterLayerProperty
 - GradientLayerProperty
 - ReplicatorLayerProperty
 - TextLayerProperty
*/
public struct ContentsFormat: UnsettableLayerPropertyConformance {
    // contentsFormat is documented as { get set } but setting appears to have no affect, so it's implemented here as read-only

    public typealias KeyValueType = CALayerContentsFormat

    public let value: KeyValueType?
    public static var keyPath: String { return "contentsFormat" }
}
