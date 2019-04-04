//
//  FontSize.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CALayer's fontSize property, as CGFloat

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: CGFloat

 ## Usage Examples ##
 ````
 myLayer.set(FontSize(12))
 let fontSize = myLayer.get(FontSize.self)
 let fontSizeDescriptor = Descriptor.Basic<FontSize>.from(10, to: 15, duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - TextLayerProperty
*/
public struct FontSize: AnimatableTextLayerPropertyConformance {
    public typealias KeyValueType = CGFloat

    public let value: KeyValueType?
    public static var keyPath: String { return "fontSize" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
