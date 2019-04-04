//
//  Font.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CATextLayer's font property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: UIFont

 ## Usage Examples ##
 ````
 myLayer.set(Font(.justified))
 let font = myLayer.get(Font.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - TextLayerProperty
*/
public struct Font: TextLayerPropertyConformance {
    public typealias KeyValueType = UIFont

    public let value: KeyValueType?
    public static var keyPath: String { return "font" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
