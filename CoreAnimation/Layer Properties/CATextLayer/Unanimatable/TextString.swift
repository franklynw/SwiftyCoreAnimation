//
//  TextString.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


/**
 Wrapper for the CATextLayer's string property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: String

 ## Usage Examples ##
 ````
 myLayer.set(TextString("some text"))
 let string = myLayer.get(TextString.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - TextLayerProperty
*/
public struct TextString: TextLayerPropertyConformance {
    public typealias KeyValueType = String

    public let value: KeyValueType?
    public static var keyPath: String { return "string" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }
}
