//
//  Properties.SceneKit.swift
//  CoreAnimation
//
//  Created by Franklyn on 01/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit
import SceneKit


extension Properties {

    /// Describes the animation's SceneKit-specific properties (for animations attached to SceneKit objects)
    ///
    /// - usesSceneTimeBase: the animation's usesSceneTimeBase
    /// - fadeInDuration: the animation's fadeInDuration
    /// - fadeOutDuration: the animation's fadeOutDuration
    /// - animationEvents: the animation's animationEvents
    public enum SceneKit: PropertiesApplicableToBasicAnimations,
        PropertiesApplicableToKeyFrameAnimations,
        PropertiesApplicableToSpringAnimations,
        PropertiesApplicableToTransitions,
        AnimationPropertiesApplying,
        InternalAnimationPropertiesApplying {

        public typealias AnimationType = CAAnimation

        /// The animation's usesSceneTimeBase property
        case usesSceneTimeBase(Bool)
        /// The animation's fadeInDuration property
        case fadeInDuration(TimeInterval)
        /// The animation's fadeOutDuration property
        case fadeOutDuration(TimeInterval)
        /// The animation's animationEvents property
        case animationEvents([SCNAnimationEvent]?)

        public func apply(to animation: CAAnimation) {
            self.applyProperty(to: animation)
        }

        internal func applyProperty(to animation: CAAnimation) {

            switch self {
            case .usesSceneTimeBase(let usesSceneTimeBase):
                animation.usesSceneTimeBase = usesSceneTimeBase
            case .fadeInDuration(let fadeInDuration):
                animation.fadeInDuration = CGFloat(fadeInDuration)
            case .fadeOutDuration(let fadeOutDuration):
                animation.fadeOutDuration = CGFloat(fadeOutDuration)
            case .animationEvents(let animationEvents):
                animation.animationEvents = animationEvents
            }
        }
    }
}
