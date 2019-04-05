//
//  Descriptor.Wait.swift
//  SwiftyCoreAnimation
//
//  Created by Franklyn on 21/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Descriptor {

    /**
     A Descriptor for creating an empty CABasicAnimation, for the purposes of waiting

     The use case for this is as part of an animation sequence, using Descriptor.Group.Sequence,
     as a descriptor in the array of descriptors used to construct the group.

     They will work outside of this, but there's not really any point as the animation literally does nothing

     ## Usage Example ##
     Create a Descriptor for a 2-second wait, & add it to a sequence:
     ````
     let fillColorDescriptor = Descriptor.Basic<FillColor>.from(.red, to: .blue)
     let waitDescriptor = Descriptor.Wait(for: 2)
     let lineWidthDescriptor = Descriptor.Basic<LineWidth>.from(currentLineWidth, to: 10, duration: 1)

     let groupDescriptor = Descriptor.Group.Sequential(using: [fillColorDescriptor, waitDescriptor, lineWidthDescriptor])

     do {
        try myShapeLayer.addAnimationsGroup(describedBy: groupDescriptor)
     } catch {
        // handle the error thrown if any of the animatable properties are not appropriate for the layer type (eg, fillColor on CAGradientLayer)
     }
     ````
    */
    public final class Wait: Root, AnimationDescribing {

        private static let animationKey = "wait"

        public var animationDidBegin: AnimationBeginAction?


        public init(for duration: TimeInterval) {
            super.init(duration: duration, animationProperties: [], propertyTypes: [])
        }

        internal var animation: CAAnimation {

            let animation: CABasicAnimation = CABasicAnimation(keyPath: Wait.animationKey)
            animation.fromValue = 0
            animation.toValue = 1

            if let duration = self.duration {
                animation.duration = duration
            }

            return animation
        }
    }
}
