//
//  ForegroundColor.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CATextLayer's foregroundColor property, as UIColor

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: UIColor

 ## Usage Examples ##
 ````
 myLayer.set(ForegroundColor(.green))
 let foregroundColor = myLayer.get(ForegroundColor.self)
 let foregroundColorDescriptor = Descriptor.Basic<ForegroundColor>.from(.clear, to: .red, duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - TextLayerProperty
*/
public struct ForegroundColor: AnimatableTextLayerPropertyConformance {
    public typealias KeyValueType = UIColor

    public let value: KeyValueType?
    public static var keyPath: String { return "foregroundColor" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /**
     Wrapper for the CATextLayer's foregroundColor property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: CGColor

     ## Usage Examples ##
     ````
     myLayer.set(ForegroundColor.CGColor(UIColor.green.cgColor))
     let foregroundColor = myLayer.get(ForegroundColor.CGColor.self)
     let foregroundColorDescriptor = Descriptor.Basic<ForegroundColor.CGColor>.from(UIColor.clear.cgColor, to: UIColor.red.cgColor, duration: 1)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - TextLayerProperty
    */
    public struct CGColor: AnimatableTextLayerPropertyConformance {
        public typealias KeyValueType = UIKit.CGColor

        public let value: KeyValueType?
        public static var keyPath: String { return ForegroundColor.keyPath }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
