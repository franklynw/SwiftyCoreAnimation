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

    /**
     Wrapper for the CALayer's visibleRect.origin property

     Use with SwiftyCoreAnimation's get function
     - KeyValueType: CGPoint

     ## Usage Examples ##
     ````
     let visibleRectOrigin = myLayer.get(VisibleRect.Origin.self)
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
    public struct Origin: UnsettableLayerPropertyConformance {
        public typealias KeyValueType = CGPoint

        public let value: KeyValueType?
        public static var keyPath: String { return VisibleRect.keyPath.appendingKeyPath("origin") }

        /**
         Wrapper for the CALayer's visibleRect.origin.x property

         Use with SwiftyCoreAnimation's get function
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         let visibleRectOriginX = myLayer.get(VisibleRect.Origin.X.self)
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
        public struct X: UnsettableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Origin.keyPath.appendingKeyPath("x") }
        }

        /**
         Wrapper for the CALayer's visibleRect.origin.y property

         Use with SwiftyCoreAnimation's get function
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         let visibleRectOriginY = myLayer.get(VisibleRect.Origin.Y.self)
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
        public struct Y: UnsettableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Origin.keyPath.appendingKeyPath("y") }
        }
    }

    /**
     Wrapper for the CALayer's visibleRect.size property

     Use with SwiftyCoreAnimation's get function
     - KeyValueType: CGSize

     ## Usage Examples ##
     ````
     let visibleRectSize = myLayer.get(VisibleRect.Size.self)
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
    public struct Size: UnsettableLayerPropertyConformance {
        public typealias KeyValueType = CGSize

        public let value: KeyValueType?
        public static var keyPath: String { return VisibleRect.keyPath.appendingKeyPath("size") }

        /**
         Wrapper for the CALayer's visibleRect.size.width property

         Use with SwiftyCoreAnimation's get function
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         let visibleRectWidth = myLayer.get(VisibleRect.Size.Width.self)
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
        public struct Width: UnsettableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Size.keyPath.appendingKeyPath("width") }
        }

        /**
         Wrapper for the CALayer's visibleRect.size.height property

         Use with SwiftyCoreAnimation's get function
         - KeyValueType: CGFloat

         ## Usage Examples ##
         ````
         let visibleRectHeight = myLayer.get(VisibleRect.Size.Height.self)
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
        public struct Height: UnsettableLayerPropertyConformance {
            public typealias KeyValueType = CGFloat

            public let value: KeyValueType?
            public static var keyPath: String { return Size.keyPath.appendingKeyPath("height") }
        }
    }
}
