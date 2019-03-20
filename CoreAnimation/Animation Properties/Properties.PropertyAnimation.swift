//
//  Properties.PropertyAnimation.swift
//  CoreAnimation
//
//  Created by Franklyn on 01/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Properties {

    /// Describes the animation's CAPropertyAnimation-specific properties
    ///
    /// - isCumulative: the animation's isCumulative
    /// - isAdditive: the animation's isAdditive
    /// - valueFunction: the animation's valueFunction
    public enum PropertyAnimation: PropertiesApplicableToBasicAnimations,
        PropertiesApplicableToKeyFrameAnimations,
        PropertiesApplicableToSpringAnimations,
        AnimationPropertiesApplying,
        InternalAnimationPropertiesApplying {

        public typealias AnimationType = CAPropertyAnimation

        case isCumulative(Bool)
        case isAdditive(Bool)
        case valueFunction(CAValueFunction?)

        public func apply(to animation: AnimationType) {
            self.applyProperty(to: animation)
        }

        internal func applyProperty(to animation: CAAnimation) {
            guard let animation = animation as? CAPropertyAnimation else { return }

            switch self {
            case .isCumulative(let isCumulative):
                animation.isCumulative = isCumulative
            case .isAdditive(let isAdditive):
                animation.isAdditive = isAdditive
            case .valueFunction(let valueFunction):
                animation.valueFunction = valueFunction
            }
        }
    }
}
