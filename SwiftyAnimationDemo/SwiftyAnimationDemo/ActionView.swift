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
        shapeLayer.set(StrokeColor(.green))

        // the approach used here is to use actions immediately prior to the animations to set the properties so the layer is in the correct state after the animation
        // the alternative approach would be to set the fillMode to forwards & not remove the completed animations, but it doesn't leave the layer in a proper state
        let properties: [PropertiesApplicableToBasicAnimations] = [] // not necessary to specify if empty, just left here so the other version can be used if desired
//        let properties: [PropertiesApplicableToBasicAnimations] = [Properties.MediaTiming.fillMode(.forwards), Properties.isRemovedOnCompletion(false)]

        // can remove 'otherAnimationProperties' if there aren't any
        let fillColorDescriptor = Descriptor.Basic<FillColor>.from(.red, to: .purple, duration: 2, otherAnimationProperties: properties)
        let actionDescriptor = Descriptor.Action {
            // set the layer's lineWidth property before we animate it
            shapeLayer.set(LineWidth(5))
        }
        let lineWidthDescriptor = Descriptor.Basic<LineWidth>.from(0, to: 5, duration: 2, otherAnimationProperties: properties)
        let action2Descriptor = Descriptor.Action {
            // set the layer's fillColor property before we animate it
            shapeLayer.set(FillColor(.clear))
        }
        let fillColorDescriptor2 = Descriptor.Basic<FillColor>.from(.purple, to: .clear, duration: 2, otherAnimationProperties: properties)

        self.layer.addSublayer(shapeLayer)

        try? shapeLayer.addAnimationSequence(describedBy: [fillColorDescriptor, actionDescriptor, lineWidthDescriptor, action2Descriptor, fillColorDescriptor2], animationFinished: { _, _ in
            print("All done")
        })
    }
}
