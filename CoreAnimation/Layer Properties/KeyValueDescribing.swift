//
//  KeyValueDescribing.swift
//  CoreAnimation
//
//  Created by Franklyn on 18/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Allows animations to be created using Swift types which implement the protocol, rather than Any?
/// This means that we use values appropriate for the animated property, such as CGFloat for the strokeEnd, etc.
public protocol KeyValueDescribing {
    var keyValue: Any? { get }
}


extension String: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension Bool: KeyValueDescribing {
    public var keyValue: Any? {
        return NSNumber(value: self)
    }
}

extension UInt32: KeyValueDescribing {
    public var keyValue: Any? {
        return NSNumber(value: self)
    }
}

extension Int: KeyValueDescribing {
    public var keyValue: Any? {
        return NSNumber(value: self)
    }
}

extension Float: KeyValueDescribing {
    public var keyValue: Any? {
        return NSNumber(value: self)
    }
}

extension Double: KeyValueDescribing {
    public var keyValue: Any? {
        return NSNumber(value: self)
    }
}

extension CGFloat: KeyValueDescribing {
    public var keyValue: Any? {
        return NSNumber(value: Double(self))
    }
}

extension CGPoint: KeyValueDescribing {
    public var keyValue: Any? {
        return NSValue(cgPoint: self)
    }
}

extension CGSize: KeyValueDescribing {
    public var keyValue: Any? {
        return NSValue(cgSize: self)
    }
}

extension CGRect: KeyValueDescribing {
    public var keyValue: Any? {
        return NSValue(cgRect: self)
    }
}

extension CGColor: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension UIColor: KeyValueDescribing {
    public var keyValue: Any? {
        return self.cgColor
    }
}

extension UIImage: KeyValueDescribing {
    public var keyValue: Any? {
        return self.cgImage
    }
}

extension UIBezierPath: KeyValueDescribing {
    public var keyValue: Any? {
        return self.cgPath
    }
}

extension CGImage: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension CALayer: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension CGPath: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension UIFont: KeyValueDescribing {
    public var keyValue: Any? {
        return CTFontCreateWithName(self.fontName as CFString, self.pointSize as CGFloat, nil)
    }
}

extension CATransform3D: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension CAGradientLayerType: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension CALayerContentsGravity: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension CAEdgeAntialiasingMask: KeyValueDescribing {
    public var keyValue: Any? {
        return self.rawValue
    }
}

extension CALayerContentsFormat: KeyValueDescribing {
    public var keyValue: Any? {
        return self.rawValue
    }
}

extension CACornerMask: KeyValueDescribing {
    public var keyValue: Any? {
        return self.rawValue
    }
}

extension CAShapeLayerFillRule: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension CAShapeLayerLineCap: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension CAShapeLayerLineJoin: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension CAEmitterCell: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension CAEmitterLayerRenderMode: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension CAEmitterLayerEmitterShape: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension CAEmitterLayerEmitterMode: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension CATextLayerAlignmentMode: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension CATextLayerTruncationMode: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}

extension Array: KeyValueDescribing where Element: KeyValueDescribing {
    public var keyValue: Any? {
        return self.map { $0.keyValue }
    }
}

extension Dictionary: KeyValueDescribing {
    public var keyValue: Any? {
        return self
    }
}
