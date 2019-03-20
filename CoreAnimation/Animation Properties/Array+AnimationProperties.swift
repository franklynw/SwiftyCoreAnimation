//
//  Array+AnimationProperties.swift
//  CoreAnimation
//
//  Created by Franklyn on 01/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


public extension Array where Element: (PropertiesApplicableToBasicAnimations & PropertiesApplicableToKeyFrameAnimations & PropertiesApplicableToSpringAnimations) {

    public func apply<T: CAPropertyAnimation>(to animation: T) {
        self._apply(to: animation)
    }
}


public extension Array where Element: (PropertiesApplicableToBasicAnimations & PropertiesApplicableToKeyFrameAnimations & PropertiesApplicableToSpringAnimations & PropertiesApplicableToTransitions) {

    public func apply(to transition: CATransition) {
        self._apply(to: transition)
    }
}


public extension Array where Element: PropertiesApplicableToKeyFrameAnimations {

    public func apply(to animation: CAKeyframeAnimation) {
        self._apply(to: animation)
    }
}


public extension Array where Element: PropertiesApplicableToSpringAnimations {

    public func apply(to animation: CASpringAnimation) {
        self._apply(to: animation)
    }
}


private extension Array {

    func _apply(to animation: CAAnimation) {
        self.forEach {
            guard let element = $0 as? InternalAnimationPropertiesApplying else { return }
            element.applyProperty(to: animation)
        }
    }
}
