//
//  Descriptor.KeyFrame.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Descriptor {

    // MARK: - Describes a KeyFrame Animation on the specified property T
    public final class KeyFrame<T: BaseLayerProperty & KeyValueProviding & Animatable>: Root, AnimationDescribing {

        public typealias AnimationType = CAKeyframeAnimation

        private let values: [Any]?
        private let path: CGPath?


        fileprivate init(values: [Any]?,
                         path: CGPath?,
                         duration: TimeInterval?,
                         animationProperties: [PropertiesApplicableToKeyFrameAnimations]) {

            self.values = values
            self.path = path

            super.init(duration: duration, animationProperties: animationProperties, propertyTypes: [T.self])
        }

        /// Creates & returns an instance of the animation described by the class instance
        override internal var animation: AnimationType {

            let animation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: T.keyPath)

            animation.values = self.values
            animation.path = self.path

            self.setBaseProperties(for: animation)

            return animation
        }
    }
}


extension Descriptor.KeyFrame {

    /// Creates a Descriptor for a KeyFrame Animation
    ///
    /// - Parameters:
    ///   - path: the animation's path (as CGPath)
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToKeyFrameAnimations
    /// - Returns: a KeyFrame Descriptor object
    public static func path(_ path: CGPath,
                            duration: TimeInterval? = nil,
                            otherAnimationProperties: [PropertiesApplicableToKeyFrameAnimations] = []) -> Self {

        return self.init(values: nil,
                         path: path,
                         duration: duration,
                         animationProperties: otherAnimationProperties)
    }

    /// Creates a Descriptor for a KeyFrame Animation
    ///
    /// - Parameters:
    ///   - path: the animation's path (as UIBezierPath)
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToKeyFrameAnimations
    /// - Returns: a KeyFrame Descriptor object
    public static func path(_ path: UIBezierPath,
                            duration: TimeInterval? = nil,
                            otherAnimationProperties: [PropertiesApplicableToKeyFrameAnimations] = []) -> Self {

        return self.init(values: nil,
                         path: path.cgPath,
                         duration: duration,
                         animationProperties: otherAnimationProperties)
    }

    /// Creates a Descriptor for a KeyFrame Animation
    ///
    /// - Parameters:
    ///   - values: the animation's values
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToKeyFrameAnimations
    /// - Returns: a KeyFrame Descriptor object
    public static func values(_ values: [T.KeyValueType],
                              duration: TimeInterval? = nil,
                              otherAnimationProperties: [PropertiesApplicableToKeyFrameAnimations] = []) -> Self {

        return self.init(values: values.compactMap { $0.keyValue },
                         path: nil,
                         duration: duration,
                         animationProperties: otherAnimationProperties)
    }
}
