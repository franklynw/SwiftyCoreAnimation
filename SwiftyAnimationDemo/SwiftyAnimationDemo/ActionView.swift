//
//  ActionView.swift
//  SwiftyAnimationDemo
//
//  Created by Franklyn on 20/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit
import SwiftyCoreAnimation


class ActionView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()

        let shapeLayer: CAShapeLayer = CAShapeLayer()

        shapeLayer.set(Path(UIBezierPath(ovalIn: CGRect(x: 20, y: 50, width: 100, height: 150)).cgPath))
        shapeLayer.set(FillColor(.purple))
//        shapeLayer.set(LineWidth(5))
        shapeLayer.set(StrokeColor(.green))

        let properties: [PropertiesApplicableToBasicAnimations] = []//[Properties.MediaTiming.fillMode(.forwards), Properties.isRemovedOnCompletion(false)]

        let fillColorDescriptor = Descriptor.Basic<FillColor>.from(.red, to: .purple, duration: 2, otherAnimationProperties: properties)
        let actionDescriptor = Descriptor.Action {
            shapeLayer.set(LineWidth(5))
            print("Wey hey Here's an action")
        }
        let lineWidthDescriptor = Descriptor.Basic<LineWidth>.from(0, to: 5, duration: 2, otherAnimationProperties: properties)
//        let clearColorDescriptor = Descriptor.Basic<FillColor>.from(.purple, to: .clear, duration: 2, otherAnimationProperties: properties)
        let action2Descriptor = Descriptor.Action {
            shapeLayer.set(FillColor(.clear))
            print("Wey hey Here's another action")
        }
        let fillColorDescriptor2 = Descriptor.Basic<FillColor>.from(.purple, to: .clear, duration: 2, otherAnimationProperties: properties)

        self.layer.addSublayer(shapeLayer)

//        let animation = fillColorDescriptor.animation
//        animation.addAnimationFinishedAction { _, _ in
//            let nextAnimation = lineWidthDescriptor.animation
//            shapeLayer.set(LineWidth(5))
//            shapeLayer.add(nextAnimation, forKey: nil)
//        }
//
//        shapeLayer.add(animation, forKey: nil)

//        try? shapeLayer.addSequentialAnimationsGroup(describedBy: [fillColorDescriptor, actionDescriptor, lineWidthDescriptor, action2Descriptor], applyingOtherProperties: properties)
        try? shapeLayer.addSequentialAnimations(describedBy: [fillColorDescriptor, actionDescriptor, lineWidthDescriptor, action2Descriptor, fillColorDescriptor2], animationFinished: { _, _ in
            print("All done")
        })
    }
}
