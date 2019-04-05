//
//  Properties.SpringAnimation.swift
//  CoreAnimation
//
//  Created by Franklyn on 01/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Properties {

    /// Describes the animation's Spring-specific properties
    ///
    /// - damping: the animation's damping
    /// - initialVelocity: the animation's initialVelocity
    /// - mass: the animation's mass
    /// - stiffness: the animation's stiffness
    public enum SpringAnimation: PropertiesApplicableToSpringAnimations,
        AnimationPropertiesApplying,
        InternalAnimationPropertiesApplying {

        public typealias AnimationType = CASpringAnimation

        /// The animation's damping property
        case damping(CGFloat)
        /// The animation's initialVelocity property
        case initialVelocity(CGFloat)
        /// The animation's mass property
        case mass(CGFloat)
        /// The animation's stiffness property
        case stiffness(CGFloat)

        public func apply(to animation: AnimationType) {
            self.applyProperty(to: animation)
        }

        internal func applyProperty(to animation: CAAnimation) {
            guard let animation = animation as? CASpringAnimation else { return }

            switch self {
            case .damping(let damping):
                animation.damping = damping
            case .initialVelocity(let initialVelocity):
                animation.initialVelocity = initialVelocity
            case .mass(let mass):
                animation.mass = mass
            case .stiffness(let stiffness):
                animation.stiffness = stiffness
            }
        }
    }
}
