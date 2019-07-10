//
//  UIColor+Extensions.swift
//  HandyList
//
//  Created by Franklyn on 09/05/2019.
//  Copyright © 2019 SOMA Software Ltd. All rights reserved.
//

import UIKit


extension UIColor {

    // NB - no allowance for alpha value here

    convenience init(hex: String) {

        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.removeFirst()
        }

        var rgbValue: UInt32 = 0

        Scanner(string: cString).scanHexInt32(&rgbValue)

        if cString.count == 8 {
            self.init(red: CGFloat((rgbValue & 0xFF0000) >> 24) / 255.0,
                      green: CGFloat((rgbValue & 0x00FF00) >> 16) / 255.0,
                      blue: CGFloat((rgbValue & 0x0000FF) >> 8) / 255.0,
                      alpha: CGFloat(rgbValue & 0x0000FF) / 255.0)
        } else {
            self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                      alpha: CGFloat(1))
        }
    }

    func toHex() -> String? {

        guard var components = self.cgColor.components else { return nil }

        var red: Float = 0
        var green: Float = 0
        var blue: Float = 0

        func setColorComponent(color: inout Float) {
            if let component = components.first {
                components.remove(at: 0)
                color = Float(component) * 255
            } else {
                color = 0
            }
        }

        if components.count < 4 { // greyscale
            setColorComponent(color: &red)
            green = red
            blue = red
        } else {
            setColorComponent(color: &red)
            setColorComponent(color: &green)
            setColorComponent(color: &blue)
        }

        return String(format: "%02lX%02lX%02lX", lroundf(red), lroundf(green), lroundf(blue))
    }

    func faded(_ alpha: CGFloat = 0.5) -> UIColor {
        return self.withAlphaComponent(alpha)
    }

    static func readableColor(from pageColor: UIColor) -> UIColor {

        let color: UIColor

        if pageColor.isBright {
            color = .darkGray
        } else {
            color = pageColor
        }

        return color
    }

    var contrastingColor: UIColor {
        return self.isBright ? .black : .white
    }

    // this is to get the color when blended with a white background when alpha is < 1
    var equivalentColorWithNoTransparency: UIColor {

        guard let components = self.cgColor.components?.map({ $0 * 255 }) else { return self }

        if components.count == 4 {
            let alpha = 1 - components[3] / 255
            let red = (255 - components[0]) * alpha + components[0]
            let green = (255 - components[1]) * alpha + components[1]
            let blue = (255 - components[2]) * alpha + components[2]
            let color = UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
            return color
        } else {
            let alpha = 1 - components[1] / 255
            let gray = (255 - components[0]) * alpha + components[0]
            let color = UIColor(red: gray / 255, green: gray / 255, blue: gray / 255, alpha: 1)
            return color
        }
    }

    var brightness: CGFloat {

        guard var components = self.cgColor.components else { return 0 }

        var red, green, blue: CGFloat

        if components.count < 4 { // greyscale
            red = components[0] / 255
            green = red
            blue = red
        } else {
            red = components[0] / 255
            green = components[1] / 255
            blue = components[2] / 255
        }

        let brightness = red * 299 + green * 587 + blue * 114

        return brightness
    }

    var isBright: Bool {
        let brightness = self.brightness
        return brightness > 2
    }
}
