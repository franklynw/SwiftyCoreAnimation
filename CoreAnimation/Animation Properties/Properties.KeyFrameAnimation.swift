//
//  Properties.KeyFrameAnimation.swift
//  CoreAnimation
//
//  Created by Franklyn on 01/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Properties {

    /// Describes the animation's KeyFrame-specific properties
    ///
    /// - keyTimes: the animation's keyTimes
    /// - timingFunctions: the animation's timingFunctions
    /// - calculationMode: the animation's calculationMode
    /// - rotationMode: the animation's rotationMode
    /// - tensionValues: the animation's tensionValues
    /// - continuityValues: the animation's continuityValues
    /// - biasValues: the animation's biasValues
    public enum KeyFrameAnimation: PropertiesApplicableToKeyFrameAnimations,
        AnimationPropertiesApplying,
        InternalAnimationPropertiesApplying {

        public typealias AnimationType = CAKeyframeAnimation

        case keyTimes([CGFloat]?)
        case timingFunctions([CAMediaTimingFunction]?)
        case calculationMode(CAAnimationCalculationMode)
        case rotationMode(CAAnimationRotationMode?)
        case tensionValues([CGFloat]?)
        case continuityValues([CGFloat]?)
        case biasValues([CGFloat]?)

        public func apply(to animation: AnimationType) {
            self.applyProperty(to: animation)
        }

        internal func applyProperty(to animation: CAAnimation) {
            guard let animation = animation as? CAKeyframeAnimation else { return }

            switch self {
            case .keyTimes(let keyTimes):
                animation.keyTimes = keyTimes?.map { NSNumber(value: Double($0)) }
            case .timingFunctions(let timingFunctions):
                animation.timingFunctions = timingFunctions
            case .calculationMode(let calculationMode):
                animation.calculationMode = calculationMode
            case .rotationMode(let rotationMode):
                animation.rotationMode = rotationMode
            case .tensionValues(let tensionValues):
                animation.tensionValues = tensionValues?.map { NSNumber(value: Double($0)) }
            case .continuityValues(let continuityValues):
                animation.continuityValues = continuityValues?.map { NSNumber(value: Double($0)) }
            case .biasValues(let biasValues):
                animation.biasValues = biasValues?.map { NSNumber(value: Double($0)) }
            }
        }
    }
}
