//
//  Descriptor.Transition.swift
//  CoreAnimation
//
//  Created by Franklyn on 28/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Descriptor {

    /**
     A Descriptor for creating a CATransition

     ## Usage Example ##
     Create a Descriptor for a transition, & add it to a layer:
     ````
     let transitionDescriptor = Descriptor.Transition(type: .push, subtype: .fromBottom, duration: 1.5)
     myLayer.addTransition(describedBy: transitionDescriptor)
     ````
    */
    public final class Transition: Root, AnimationDescribing {
        
        private let type: CATransitionType
        private let subtype: CATransitionSubtype?
        private let startProgress: CGFloat?
        private let endProgress: CGFloat?

        public var animationDidBegin: AnimationBeginAction?


        /// Initializer for a Descriptor for a CATransition
        ///
        /// - Parameters:
        ///   - type: the transition animation's type
        ///   - subtype: the transition animation's subtype
        ///   - startProgress: the transition animation's startProgress
        ///   - endProgress: the transition animation's endProgress
        ///   - duration: the transition animation's duration
        ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToTransitions
        public init(type: CATransitionType,
                    subtype: CATransitionSubtype? = nil,
                    startProgress: CGFloat? = nil,
                    endProgress: CGFloat? = nil,
                    duration: TimeInterval? = nil,
                    otherAnimationProperties: [PropertiesApplicableToTransitions] = []) {

            self.type = type
            self.subtype = subtype
            self.startProgress = startProgress
            self.endProgress = endProgress

            super.init(duration: duration, animationProperties: otherAnimationProperties, propertyTypes: [])
        }

        /// Creates & returns an instance of the animation described by the class instance
        internal var animation: CAAnimation {

            let animation: CATransition = CATransition()

            animation.type = self.type
            animation.subtype = self.subtype

            if let startProgress = self.startProgress {
                animation.startProgress = Float(startProgress)
            }
            if let endProgress = self.endProgress {
                animation.endProgress = Float(endProgress)
            }

            self.setBaseProperties(for: animation)

            return animation
        }
    }
}
