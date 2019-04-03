//
//  AnimationProperties.swift
//  CoreAnimation
//
//  Created by Franklyn on 27/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Type-constrained protocol for safe application of animation properties
public protocol AnimationPropertiesApplying {
    associatedtype AnimationType: CAAnimation
    func apply(to animation: AnimationType)
}

/// Internal, unconstrained protocol so we can pass the properties around
protocol InternalAnimationPropertiesApplying {
    func applyProperty(to animation: CAAnimation)
}

public protocol AnimationPropertiesApplicable {}

/// Properties which can be applied to CABasicAnimations implement this
public protocol PropertiesApplicableToBasicAnimations: AnimationPropertiesApplicable {}

/// Properties which can be applied to CAKeyFrameAnimations implement this
public protocol PropertiesApplicableToKeyFrameAnimations: AnimationPropertiesApplicable {}

/// Properties which can be applied to CASpringAnimations implement this
public protocol PropertiesApplicableToSpringAnimations: AnimationPropertiesApplicable {}

/// Properties which can be applied to CATransitions implement this
public protocol PropertiesApplicableToTransitions: AnimationPropertiesApplicable {}

/// Properties which can be applied to CAAnimationGroup implement this
public protocol PropertiesApplicableToAnimationGroups: AnimationPropertiesApplicable {}
