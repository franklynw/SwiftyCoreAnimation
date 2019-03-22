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

    private lazy var shapeLayer: CAShapeLayer = {

        let layer = CAShapeLayer()

        self.layer.addSublayer(layer)

        layer.set(Bounds(self.layer.bounds))
        layer.set(Position(CGPoint(x: self.layer.bounds.width / 2, y: self.layer.bounds.height / 2)))

        return layer
    }()

    private lazy var setup: () -> () = {
        // effectively dispatch_once each time the view appears... (has to be a lazy var rather than a let because accessing self)

        self.layer.masksToBounds = true

        _ = self.shapeLayer

        self.getGoing()

        return {}
    }()


    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup() // now that our bounds is right
    }
    
    private func getGoing() {

        let shapeLayer: CAShapeLayer = self.shapeLayer

        let x = self.bounds.width / 2
        let y = self.bounds.height / 2
        let width: CGFloat = 100
        let height: CGFloat = 150

        shapeLayer.set(Path(UIBezierPath(ovalIn: CGRect(x: x - width / 2, y: y - height / 2, width: width, height: height)).cgPath))
        shapeLayer.set(FillColor(.purple))
        shapeLayer.set(StrokeColor(.green))

        // the approach used here is to use actions immediately prior to the animations to set the properties so the layer is in the correct state after the animation
        // the alternative approach would be to set the fillMode to forwards & not remove the completed animations, but it doesn't leave the layer in a proper state
        let properties: [PropertiesApplicableToBasicAnimations] = [] // not necessary to specify if empty, just left here so the other version can be used if desired
//        let properties: [PropertiesApplicableToBasicAnimations] = [Properties.MediaTiming.fillMode(.forwards), Properties.isRemovedOnCompletion(false)]

        // can remove 'otherAnimationProperties' if there aren't any
        let fillColorDescriptor = Descriptor.Basic<FillColor>.from(.yellow, to: .purple, duration: 2, otherAnimationProperties: properties)
        let waitDescriptor = Descriptor.Wait(for: 3)
        let actionDescriptor = Descriptor.Action {
            // set the layer's lineWidth property before we animate it
            print("Action 1")
            shapeLayer.set(LineWidth(5))
        }
        let lineWidthDescriptor = Descriptor.Basic<LineWidth>.from(0, to: 5, duration: 2, otherAnimationProperties: properties)
        let action2Descriptor = Descriptor.Action {
            // set the layer's fillColor property before we animate it
            print("Action 2")
            shapeLayer.set(FillColor(.clear))
        }
        let fillColorDescriptor2 = Descriptor.Basic<FillColor>.from(.purple, to: .clear, duration: 2, otherAnimationProperties: properties)

//        self.layer.addSublayer(shapeLayer)

        // create the animation sequence
        try? shapeLayer.addAnimationSequence(describedBy: [fillColorDescriptor, waitDescriptor, actionDescriptor, lineWidthDescriptor, action2Descriptor, fillColorDescriptor2], animationFinished: { _, _ in
            print("All done")
        })

//        let groupDescriptor = Descriptor.Group.sequential(using: [fillColorDescriptor, waitDescriptor, actionDescriptor, lineWidthDescriptor, action2Descriptor, fillColorDescriptor2])

        // alternatively, use a Descriptor.Group
//        try? shapeLayer.addAnimationsGroup(describedBy: groupDescriptor, animationFinished: { _, _ in
//            print("All done")
//        })

        // another alternative is to put the sequence into a concurrent group (possibly with other animation descriptors)
        // the main thing to note here is that the animationFinished action will be invoked after the group's duration, not the sequence's
//        let rotateDescriptor = Descriptor.Basic<Transform.Rotation.Z>.from(0, to: CGFloat.pi * 2)
//        try? shapeLayer.addConcurrentAnimationsGroup(describedBy: [groupDescriptor, rotateDescriptor], duration: 9, animationFinished: { _, _ in
//            print("All done") // will be executed before Action1
//        })


        // trying to add a non-shapeLayer property animation into a CAShapeLayer group animation will throw an error

        let gradientColorsDescriptor = Descriptor.Basic<Colors>.from([.red, .blue, .green], to: [.green, .blue, .red], duration: 9)

        do {
            try shapeLayer.addAnimationSequence(describedBy: [fillColorDescriptor, gradientColorsDescriptor])
        } catch {
            print("Not allowed! ", error.localizedDescription)
        }
    }
}
