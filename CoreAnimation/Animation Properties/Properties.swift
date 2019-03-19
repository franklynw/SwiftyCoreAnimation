//
//  Properties.swift
//  CoreAnimation
//
//  Created by Franklyn on 01/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


public enum Properties: PropertiesApplicableToBasicAnimations,
    PropertiesApplicableToKeyFrameAnimations,
    PropertiesApplicableToSpringAnimations,
    PropertiesApplicableToTransitions,
    AnimationPropertiesApplying,
    InternalAnimationPropertiesApplying {

    /// Describes some of the animation's base CAAnimation-specific properties
    ///
    /// - isRemovedOnCompletion: the animation's isRemovedOnCompletion
    /// - timingFunction: the animation's timingFunction

    public typealias AnimationType = CAAnimation

    case isRemovedOnCompletion(Bool)
    case timingFunction(CAMediaTimingFunction)

    public func apply(to animation: AnimationType) {
        self.applyProperty(to: animation)
    }

    internal func applyProperty(to animation: CAAnimation) {
        guard let animation = animation as? CAPropertyAnimation else { return }

        switch self {
        case .isRemovedOnCompletion(let isRemovedOnCompletion):
            animation.isRemovedOnCompletion = isRemovedOnCompletion
        case .timingFunction(let timingFunction):
            animation.timingFunction = timingFunction
        }
    }
}
