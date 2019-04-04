//
//  AlignmentMode.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CATextLayer's alignmentMode property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: CATextLayerAlignmentMode

 ## Usage Examples ##
 ````
 myLayer.set(AlignmentMode(.justified))
 let alignmentMode = myLayer.get(AlignmentMode.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - TextLayerProperty
*/
public struct AlignmentMode: TextLayerPropertyConformance {
    public typealias KeyValueType = CATextLayerAlignmentMode

    public let value: KeyValueType?
    public static var keyPath: String { return "alignmentMode" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
