//
//  Colors.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/**
 Wrapper for the CAGradientLayer's colors property, as [UIColor]

 Use with Descriptors or SwiftyCoreAnimation's set/get functions
 - KeyValueType: [UIColor]

 ## Usage Examples ##
 ````
 myLayer.set(Colors([.green, .blue, .red]))
 let colors = myLayer.get(Colors.self)
 let colorsDescriptor = Descriptor.Basic<Colors>.from([.green, .blue, .red], to: [.red, .green, .blue], duration: 1)
 ````

 Conforms to -
 - Settable
 - Animatable
 - KeyValueProviding
 - GradientLayerProperty
*/
public struct Colors: AnimatableGradientLayerPropertyConformance {
    public typealias KeyValueType = Array<UIColor>

    public let value: KeyValueType?
    public static var keyPath: String { return "colors" }

    public init(_ value: KeyValueType?) {
        self.value = value
    }

    /**
     Wrapper for the CAGradientLayer's colors property

     Use with Descriptors or SwiftyCoreAnimation's set/get functions
     - KeyValueType: [CGColor]

     ## Usage Examples ##
     ````
     myLayer.set(Colors.CGColors([UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.red.cgColor]))
     let colors = myLayer.get(Colors.CGColors.self)
     let colorsDescriptor = Descriptor.Basic<Colors.CGColors>.from([UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.red.cgColor], to: [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor], duration: 1)
     ````

     Conforms to -
     - Settable
     - Animatable
     - KeyValueProviding
     - GradientLayerProperty
     */
    public struct CGColors: AnimatableGradientLayerPropertyConformance {
        public typealias KeyValueType = Array<CGColor>

        public let value: KeyValueType?
        public static var keyPath: String { return Colors.keyPath }

        public init(_ value: KeyValueType?) {
            self.value = value
        }
    }
}
