//
//  Descriptor.Spring.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Descriptor {

    // MARK: - Describes a Spring Animation on the specified property T
    public final class Spring<T: BaseLayerProperty & KeyValueProviding & Animatable>: Root, AnimationDescribing {

        private let from: Any?
        private let by: Any?
        private let to: Any?


        /// Initializer for a Descriptor for a Spring Animation
        ///
        /// - Parameters:
        ///   - duration: the animation's duration
        ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToSpringAnimations
        public convenience init(duration: TimeInterval? = nil,
                                otherAnimationProperties: [PropertiesApplicableToSpringAnimations] = []) {

            self.init(from: nil,
                      by: nil,
                      to: nil,
                      duration: duration,
                      animationProperties: otherAnimationProperties)
        }

        fileprivate init(from: Any?,
                         by: Any?,
                         to: Any?,
                         duration: TimeInterval?,
                         animationProperties: [PropertiesApplicableToSpringAnimations]) {

            self.from = from
            self.by = by
            self.to = to

            super.init(duration: duration, animationProperties: animationProperties, propertyTypes: [T.self])
        }

        /// Creates & returns an instance of the animation described by the class instance
        internal var animation: CAAnimation {

            let animation: CASpringAnimation = CASpringAnimation(keyPath: T.keyPath)

            animation.fromValue = self.from
            animation.byValue = self.by
            animation.toValue = self.to

            self.setBaseProperties(for: animation)

            return animation
        }
    }
}


extension Descriptor.Spring {

    /// Creates a Descriptor for a Spring Animation
    ///
    /// - Parameters:
    ///   - from: used for the fromValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToSpringAnimations
    /// - Returns: a Spring Descriptor object
    public static func from(_ from: T.KeyValueType?,
                            duration: TimeInterval? = nil,
                            otherAnimationProperties: [PropertiesApplicableToSpringAnimations] = []) -> Self {

        return self.init(from: from?.keyValue,
                         by: nil,
                         to: nil,
                         duration: duration,
                         animationProperties: otherAnimationProperties)
    }

    /// Creates a Descriptor for a Spring Animation
    ///
    /// - Parameters:
    ///   - by: used for the byValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToSpringAnimations
    /// - Returns: a Spring Descriptor object
    public static func by(_ by: T.KeyValueType?,
                          duration: TimeInterval? = nil,
                          otherAnimationProperties: [PropertiesApplicableToSpringAnimations] = []) -> Self {

        return self.init(from: nil,
                         by: by?.keyValue,
                         to: nil,
                         duration: duration,
                         animationProperties: otherAnimationProperties)
    }

    /// Creates a Descriptor for a Spring Animation
    ///
    /// - Parameters:
    ///   - to: used for the toValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToSpringAnimations
    /// - Returns: a Spring Descriptor object
    public static func to(_ to: T.KeyValueType?,
                          duration: TimeInterval? = nil,
                          otherAnimationProperties: [PropertiesApplicableToSpringAnimations] = []) -> Self {

        return self.init(from: nil,
                         by: nil,
                         to: to?.keyValue,
                         duration: duration,
                         animationProperties: otherAnimationProperties)
    }

    /// Creates a Descriptor for a Spring Animation
    ///
    /// - Parameters:
    ///   - from: used for the fromValue of the animation
    ///   - to: used for the toValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToSpringAnimations
    /// - Returns: a Spring Descriptor object
    public static func from(_ from: T.KeyValueType?,
                            to: T.KeyValueType?,
                            duration: TimeInterval? = nil,
                            otherAnimationProperties: [PropertiesApplicableToSpringAnimations] = []) -> Self {

        return self.init(from: from?.keyValue,
                         by: nil,
                         to: to?.keyValue,
                         duration: duration,
                         animationProperties: otherAnimationProperties)
    }

    /// Creates a Descriptor for a Spring Animation
    ///
    /// - Parameters:
    ///   - from: used for the fromValue of the animation
    ///   - by: used for the byValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToSpringAnimations
    /// - Returns: a Spring Descriptor object
    public static func from(_ from: T.KeyValueType?,
                            by: T.KeyValueType?,
                            duration: TimeInterval? = nil,
                            otherAnimationProperties: [PropertiesApplicableToSpringAnimations] = []) -> Self {

        return self.init(from: from?.keyValue,
                         by: by?.keyValue,
                         to: nil,
                         duration: duration,
                         animationProperties: otherAnimationProperties)
    }

    /// Creates a Descriptor for a Spring Animation
    ///
    /// - Parameters:
    ///   - by: used for the byValue of the animation
    ///   - to: used for the toValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToSpringAnimations
    /// - Returns: a Spring Descriptor object
    public static func by(_ by: T.KeyValueType?,
                          to: T.KeyValueType?,
                          duration: TimeInterval? = nil,
                          otherAnimationProperties: [PropertiesApplicableToSpringAnimations] = []) -> Self {

        return self.init(from: nil,
                         by: by?.keyValue,
                         to: to?.keyValue,
                         duration: duration,
                         animationProperties: otherAnimationProperties)
    }
}
