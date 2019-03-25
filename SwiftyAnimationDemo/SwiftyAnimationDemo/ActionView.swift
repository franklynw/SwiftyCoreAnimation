//
//  ActionView.swift
//  SwiftyAnimationDemo
//
//  Created by Franklyn on 20/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit
import SwiftyCoreAnimation

/*
 This demonstrates the use of action group descriptors - both for concurrent animations & sequences

 For concurrent groups, the functionality is the same as the existing, just with more 'Swifty'syntax

 For sequences, it expands upon what is available using existing CAAnimationGroup functionality -
 'Action' descriptors can be put into the sequence - they are invoked when their turn comes in the sequence
 'Wait' descriptors can be put into the sequence - they just tell the sequence to wait before continuing to the next animation element
 Unlike CAAnimationGroup animations, each animation in the sequence can have its own animationFinished action
 Both concurrent & sequence group descriptors can be added to new group descriptors
*/

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

        let ellipsePath = UIBezierPath(ovalIn: CGRect(x: x - width / 2, y: y - height / 2, width: width, height: height)).cgPath
        shapeLayer.set(Path(ellipsePath))
        shapeLayer.set(FillColor(.yellow))
        shapeLayer.set(StrokeColor(.green))

        // the approach used here is to use actions immediately prior to the animations to set the properties so the layer is in the correct state after the animation
        let properties: [PropertiesApplicableToBasicAnimations] = [] // not necessary to specify if empty, just left here so the other version can be used if desired

        // the alternative approach would be to set the fillMode to forwards & not remove the completed animations, but it doesn't leave the layer in a proper state
//        let properties: [PropertiesApplicableToBasicAnimations] = [Properties.MediaTiming.fillMode(.forwards), Properties.isRemovedOnCompletion(false)]


        // set up the first sequence

        // use this each time we want to wait for 3 seconds
        let waitDescriptor = Descriptor.Wait(for: 3)

        // this sets the actual fillColor property of the shapeLayer, before we animate it - called as an action after the wait
        let setFillColorActionDescriptor = Descriptor.Action {
            shapeLayer.set(FillColor(.purple))
        }

        // next, animate the fillColor
        // can remove 'otherAnimationProperties' if there aren't any
        let fillColorDescriptor = Descriptor.Basic<FillColor>.from(.yellow, to: .purple, duration: 2, otherAnimationProperties: properties)

        // now set the actual lineWidth property before we animate it
        let setLineWidthActionDescriptor = Descriptor.Action {
            // set the layer's lineWidth property before we animate it
            print("Doing setLineWidthActionDescriptor")
            shapeLayer.set(LineWidth(5))
        }

        // then animate the lineWidth
        let lineWidthDescriptor = Descriptor.Basic<LineWidth>.from(0, to: 5, duration: 2, otherAnimationProperties: properties)

        // now set the fillColor property again before we animate it again
        let setFillColorActionDescriptor2 = Descriptor.Action {
            // set the layer's fillColor property before we animate it
            print("Doing setFillColorActionDescriptor2")
            shapeLayer.set(FillColor(.orange))
        }

        // finally, animate the fillColor again
        let fillColorDescriptor2 = Descriptor.Basic<FillColor>.from(.purple, to: .orange, duration: 2, otherAnimationProperties: properties)

        // if we just wanted the sequence, we can create it like so
//        try? shapeLayer.addAnimationSequence(describedBy: [waitDescriptor, setFillColorActionDescriptor, fillColorDescriptor, waitDescriptor, setLineWidthActionDescriptor, lineWidthDescriptor, setFillColorActionDescriptor2, fillColorDescriptor2], animationFinished: { _, _ in
//            print("All done")
//        })


        // however, we want to include it as part of another animation, so it's easier to make a separate sequence descriptor
        let groupDescriptor = Descriptor.Group.sequential(using: [waitDescriptor, setFillColorActionDescriptor, fillColorDescriptor, waitDescriptor, setLineWidthActionDescriptor, lineWidthDescriptor, setFillColorActionDescriptor2, fillColorDescriptor2])

        // if we want to run the sequence concurrently with another animation, we can put it into a concurrent animation group
        // the main thing to note here is that the animationFinished action will be invoked after the group's duration, not the sequence's duration
        // so if the action is required after all the animations finish, either set the duration of the group so it matches the sequences,
        // or add it as an actionDescriptor at the end of the animation sequence
//        let rotateDescriptor = Descriptor.Basic<Transform.Rotation.Z>.from(0, to: CGFloat.pi * 2)
//        try? shapeLayer.addConcurrentAnimationsGroup(describedBy: [groupDescriptor, rotateDescriptor], duration: 9, animationFinished: { _, _ in
//            print("All done") // will be executed after setFillColorActionDescriptor & setLineWidthActionDescriptor, but before setFillColorActionDescriptor2
//        })

        // now we want to move & rotate at the same time, so make a concurrent group
        let keyFrameProperties: [Properties.KeyFrameAnimation] = [.calculationMode(.paced)]
        var translate = CGAffineTransform(translationX: width / -2, y: 0)
        let offsetEllipse = ellipsePath.copy(using: &translate)!
        let moveDescriptor = Descriptor.KeyFrame<Position>.path(offsetEllipse, otherAnimationProperties: keyFrameProperties)
        let rotateDescriptor = Descriptor.Basic<Transform.Rotation>.from(0, to: CGFloat.pi * 4)

        let groupDescriptor2 = Descriptor.Group.concurrent(using: [moveDescriptor, rotateDescriptor], duration: 3)

        // then put everything into a sequence
        try? shapeLayer.addAnimationSequence(describedBy: [groupDescriptor, waitDescriptor, groupDescriptor2], animationFinished: { _, _ in
            print("We're all done now")
        })


        // trying to add a non-shapeLayer property animation into a CAShapeLayer group animation will throw an error (& do nothing)

        let gradientColorsDescriptor = Descriptor.Basic<Colors>.from([.red, .blue, .green], to: [.green, .blue, .red], duration: 9)

        do {
            try shapeLayer.addAnimationSequence(describedBy: [fillColorDescriptor, gradientColorsDescriptor])
        } catch {
            print("Not allowed! ", error.localizedDescription)
        }
    }
}
