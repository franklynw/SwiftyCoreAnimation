//
//  KeyValueProviding.swift
//  CoreAnimation
//
//  Created by Franklyn on 04/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


public protocol KeyValueProviding {
    associatedtype KeyValueType: KeyValueDescribing
    var value: KeyValueType? { get }
    static func toKeyValueType(_ from: Any?) -> KeyValueType?
}


extension KeyValueProviding {
    // String
    // CALayer
    // CATransform3D
    // CAGradientLayerType
    // CALayerContentsGravity
    // CAShapeLayerFillRule
    // CAShapeLayerLineCap
    // CAShapeLayerLineJoin
    // CAEmitterCell
    // CAEmitterLayerRenderMode
    // CAEmitterLayerEmitterShape
    // CAEmitterLayerEmitterMode
    // CATextLayerAlignmentMode
    // CATextLayerTruncationMode
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        return from as? KeyValueType
    }
}

extension KeyValueProviding where KeyValueType == Bool {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        return (from as? NSNumber)?.boolValue
    }
}

extension KeyValueProviding where KeyValueType == UInt32 {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        return (from as? NSNumber)?.uint32Value
    }
}

extension KeyValueProviding where KeyValueType == Int {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        return (from as? NSNumber)?.intValue
    }
}

extension KeyValueProviding where KeyValueType == Float {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        return (from as? NSNumber)?.floatValue
    }
}

extension KeyValueProviding where KeyValueType == Double {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        return (from as? NSNumber)?.doubleValue
    }
}

extension KeyValueProviding where KeyValueType == CGFloat {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        guard let number: Double = (from as? NSNumber)?.doubleValue else { return nil }
        return CGFloat(number)
    }
}

extension KeyValueProviding where KeyValueType == CGPoint {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        return (from as? NSValue)?.cgPointValue
    }
}

extension KeyValueProviding where KeyValueType == CGSize {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        return (from as? NSValue)?.cgSizeValue
    }
}

extension KeyValueProviding where KeyValueType == CGRect {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        return (from as? NSValue)?.cgRectValue
    }
}

extension KeyValueProviding where KeyValueType == UIFont {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        if let ctFonts = [from] as? [CTFont], let ctFont = ctFonts.first {
            return ctFont as UIFont
        } else if let cgFonts = [from] as? [CGFont], let cgFont = cgFonts.first {
            if let cfFontName = cgFont.postScriptName {
                let fontName = (cfFontName as NSString) as String
                return UIFont(name: fontName, size: 12) // CGFont doesn't contain size information
            }
        }
        return nil
    }
}

extension KeyValueProviding where KeyValueType == UIColor {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        guard let from = from else { return nil }
        let cgColor = from as! CGColor // we can always guarantee that it will be a CGColor here
        return UIColor(cgColor: cgColor)
    }
}

extension KeyValueProviding where KeyValueType == CGColor {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        guard let from = from else { return nil }
        let cgColor = from as! CGColor // we can always guarantee that it will be a CGColor here
        return cgColor
    }
}

extension KeyValueProviding where KeyValueType == UIImage {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        // we can't guarantee that the values for keyPaths such as content are actually going to be a CGImage,
        // so we have to go through this bizarre casting shenanigans...
        guard let from = from else { return nil }
        guard let images: [CGImage] = [from] as? [CGImage] else { return nil }
        guard let cgImage: CGImage = images.first else { return nil }
        return UIImage(cgImage: cgImage)
    }
}

extension KeyValueProviding where KeyValueType == CGImage {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        // we can't guarantee that the values for keyPaths such as content are actually going to be a CGImage,
        // so we have to go through this bizarre casting shenanigans...
        guard let from = from else { return nil }
        guard let images: [CGImage] = [from] as? [CGImage] else { return nil }
        return images.first
    }
}

extension KeyValueProviding where KeyValueType == UIBezierPath {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        guard let from = from else { return nil }
        let cgPath = from as! CGPath // we can always guarantee that it will be a CGPath here
        return UIBezierPath(cgPath: cgPath)
    }
}

extension KeyValueProviding where KeyValueType == CALayerContentsFormat {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        guard let rawValue: String = from as? String else { return nil }
        return CALayerContentsFormat(rawValue: rawValue)
    }
}

extension KeyValueProviding where KeyValueType == CAEdgeAntialiasingMask {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        guard let rawValue: UInt32 = (from as? NSNumber)?.uint32Value else { return nil }
        return CAEdgeAntialiasingMask(rawValue: rawValue)
    }
}

extension KeyValueProviding where KeyValueType == CACornerMask {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        guard let rawValue: UInt = (from as? NSNumber)?.uintValue else { return nil }
        return CACornerMask(rawValue: rawValue)
    }
}

extension KeyValueProviding where KeyValueType == Array<UIColor> {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        let colors: [CGColor]? = from as? [CGColor]
        return colors?.compactMap { UIColor(cgColor: $0) }
    }
}

extension KeyValueProviding where KeyValueType == Array<CGColor> {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        return from as? [CGColor]
    }
}

extension KeyValueProviding where KeyValueType == Array<CGFloat> {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        let numbers: [NSNumber]? = from as? [NSNumber]
        return numbers?.compactMap { CGFloat($0.doubleValue) }
    }
}

extension KeyValueProviding where KeyValueType == Array<CALayer> {
    public static func toKeyValueType(_ from: Any?) -> KeyValueType? {
        let layers: [CALayer]? = from as? [CALayer]
        return layers
    }
}
