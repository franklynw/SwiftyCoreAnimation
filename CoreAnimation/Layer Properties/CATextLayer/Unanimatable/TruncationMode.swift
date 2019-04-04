//
//  TruncationMode.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CATextLayer's truncationMode property

 Use with SwiftyCoreAnimation's set/get functions
 - KeyValueType: CATextLayerTruncationMode

 ## Usage Examples ##
 ````
 myLayer.set(TruncationMode(.middle))
 let truncationMode = myLayer.get(TruncationMode.self)
 ````

 Conforms to -
 - Settable
 - KeyValueProviding
 - TextLayerProperty
*/
public struct TruncationMode: TextLayerPropertyConformance {
    public typealias KeyValueType = CATextLayerTruncationMode

    public let value: KeyValueType?
    public static var keyPath: String { return "truncationMode" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
