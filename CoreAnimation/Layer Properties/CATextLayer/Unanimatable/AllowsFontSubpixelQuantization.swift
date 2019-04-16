//
//  AllowsFontSubpixelQuantization.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CATextLayer's allowsFontSubpixelQuantization property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: Bool

 ## Usage Examples ##
 ````
 myLayer.set(AllowsFontSubpixelQuantization(true))
 let allowsFontSubpixelQuantization = myLayer.get(AllowsFontSubpixelQuantization.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - TextLayerProperty
*/
public struct AllowsFontSubpixelQuantization: TextLayerPropertyConformance {
    public typealias KeyValueType = Bool

    public let value: KeyValueType?
    public static var keyPath: String { return "allowsFontSubpixelQuantization" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
