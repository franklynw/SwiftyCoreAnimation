//
//  Properties.MediaTiming.swift
//  CoreAnimation
//
//  Created by Franklyn on 01/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Properties {

    /// Describes the properties for the animation's CAMediaTiming protocol conformance
    ///
    /// - beginTime: the animation's beginTime
    /// - timeOffset: the animation's timeOffset
    /// - repeatCount: the animation's repeatCount
    /// - repeatDuration: the animation's repeatDuration
    /// - speed: the animation's speed
    /// - autoreverses: the animation's autoreverses
    /// - fillMode: the animation's fillMode
    public enum MediaTiming: PropertiesApplicableToBasicAnimations,
        PropertiesApplicableToKeyFrameAnimations,
        PropertiesApplicableToSpringAnimations,
        PropertiesApplicableToTransitions,
        AnimationPropertiesApplying,
        InternalAnimationPropertiesApplying {

        public typealias AnimationType = CAAnimation

        case beginTime(TimeInterval)
        case timeOffset(TimeInterval)
        case repeatCount(Int)
        case repeatDuration(TimeInterval)
        case speed(CGFloat)
        case autoreverses(Bool)
        case fillMode(CAMediaTimingFillMode)

        public func apply(to animation: AnimationType) {
            self.applyProperty(to: animation)
        }

        internal func applyProperty(to animation: CAAnimation) {

            switch self {
            case .beginTime(let beginTime):
                animation.beginTime = beginTime
            case .timeOffset(let timeOffset):
                animation.timeOffset = timeOffset
            case .repeatCount(let repeatCount):
                animation.repeatCount = Float(repeatCount)
            case .repeatDuration(let repeatDuration):
                animation.repeatDuration = repeatDuration
            case .speed(let speed):
                animation.speed = Float(speed)
            case .autoreverses(let autoreverses):
                animation.autoreverses = autoreverses
            case .fillMode(let fillMode):
                animation.fillMode = fillMode
            }
        }
    }
}
