//
//  Array+AnimationProperties.swift
//  CoreAnimation
//
//  Created by Franklyn on 01/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Array where Element: (PropertiesApplicableToBasicAnimations & PropertiesApplicableToKeyFrameAnimations & PropertiesApplicableToSpringAnimations) {

    func apply<T: CAPropertyAnimation>(to animation: T) {
        self._apply(to: animation)
    }
}


extension Array where Element: (PropertiesApplicableToBasicAnimations & PropertiesApplicableToKeyFrameAnimations & PropertiesApplicableToSpringAnimations & PropertiesApplicableToTransitions) {

    func apply(to transition: CATransition) {
        self._apply(to: transition)
    }
}


extension Array where Element: PropertiesApplicableToKeyFrameAnimations {

    func apply(to animation: CAKeyframeAnimation) {
        self._apply(to: animation)
    }
}


extension Array where Element: PropertiesApplicableToSpringAnimations {

    func apply(to animation: CASpringAnimation) {
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
