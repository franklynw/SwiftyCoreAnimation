//
//  Array+AnimationProperties.swift
//  CoreAnimation
//
//  Created by Franklyn on 01/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


public extension Array where Element: (PropertiesApplicableToBasicAnimations & PropertiesApplicableToKeyFrameAnimations & PropertiesApplicableToSpringAnimations) {

    /// Applies the properties in the array to an animation
    ///
    /// - Parameter animation: A CAPropertyAnimation subclass
    public func apply<T: CAPropertyAnimation>(to animation: T) {
        self._apply(to: animation)
    }
}


public extension Array where Element: (PropertiesApplicableToBasicAnimations & PropertiesApplicableToKeyFrameAnimations & PropertiesApplicableToSpringAnimations & PropertiesApplicableToTransitions) {

    /// Applies the properties in the array to a transition
    ///
    /// - Parameter transition: a CATransition
    public func apply(to transition: CATransition) {
        self._apply(to: transition)
    }
}


public extension Array where Element: PropertiesApplicableToKeyFrameAnimations {

    /// Applies the properties in the array to an animation
    ///
    /// - Parameter animation: a CAKeyframeAnimation
    public func apply(to animation: CAKeyframeAnimation) {
        self._apply(to: animation)
    }
}


public extension Array where Element: PropertiesApplicableToSpringAnimations {

    /// Applies the properties in the array to an animation
    ///
    /// - Parameter animation: a CASpringAnimation
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
