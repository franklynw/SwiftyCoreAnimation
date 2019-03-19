//
//  Descriptor.Basic.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Descriptor {

    // MARK: - Describes a Basic Animation on the specified property T
    public final class Basic<T: BaseLayerProperty & KeyValueProviding & Animatable>: Root, AnimationDescribing {

        public typealias AnimationType = CABasicAnimation

        private let from: Any?
        private let by: Any?
        private let to: Any?

        /// Initializer for a Descriptor for a Basic Animation
        ///
        /// - Parameters:
        ///   - duration: the animation's duration
        ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToBasicAnimations
        ///   - delegate: the animation's delegate
        public convenience init(duration: TimeInterval? = nil,
                                otherAnimationProperties: [PropertiesApplicableToBasicAnimations] = [],
                                delegate: CAAnimationDelegate? = nil) {

            self.init(from: nil,
                      by: nil,
                      to: nil,
                      duration: duration,
                      animationProperties: otherAnimationProperties,
                      delegate: delegate)
        }

        fileprivate init(from: Any?,
                         by: Any?,
                         to: Any?,
                         duration: TimeInterval?,
                         animationProperties: [PropertiesApplicableToBasicAnimations],
                         delegate: CAAnimationDelegate?) {

            self.from = from
            self.by = by
            self.to = to

            super.init(duration: duration, animationProperties: animationProperties, delegate: delegate)
        }

        /// Creates & returns an instance of the animation described by the class instance
        public var animation: AnimationType {

            let animation: CABasicAnimation = CABasicAnimation(keyPath: T.keyPath)

            animation.fromValue = self.from
            animation.byValue = self.by
            animation.toValue = self.to

            self.setBaseProperties(for: animation)

            return animation
        }
    }
}


extension Descriptor.Basic {

    /// Creates a Descriptor for a Basic Animation
    ///
    /// - Parameters:
    ///   - from: used for the fromValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToBasicAnimations
    ///   - delegate: the animation's delegate
    /// - Returns: a Basic Descriptor object
    public static func from(_ from: T.KeyValueType?,
                            duration: TimeInterval? = nil,
                            otherAnimationProperties: [PropertiesApplicableToBasicAnimations] = [],
                            delegate: CAAnimationDelegate? = nil) -> Self {

        return self.init(from: from?.keyValue,
                         by: nil,
                         to: nil,
                         duration: duration,
                         animationProperties: otherAnimationProperties,
                         delegate: delegate)
    }

    /// Creates a Descriptor for a Basic Animation
    ///
    /// - Parameters:
    ///   - by: used for the byValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToBasicAnimations
    ///   - delegate: the animation's delegate
    /// - Returns: a Basic Descriptor object
    public static func by(_ by: T.KeyValueType?,
                          duration: TimeInterval? = nil,
                          otherAnimationProperties: [PropertiesApplicableToBasicAnimations] = [],
                          delegate: CAAnimationDelegate? = nil) -> Self {

        return self.init(from: nil,
                         by: by?.keyValue,
                         to: nil,
                         duration: duration,
                         animationProperties: otherAnimationProperties,
                         delegate: delegate)
    }

    /// Creates a Descriptor for a Basic Animation
    ///
    /// - Parameters:
    ///   - to: used for the toValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToBasicAnimations
    ///   - delegate: the animation's delegate
    /// - Returns: a Basic Descriptor object
    public static func to(_ to: T.KeyValueType?,
                          duration: TimeInterval? = nil,
                          otherAnimationProperties: [PropertiesApplicableToBasicAnimations] = [],
                          delegate: CAAnimationDelegate? = nil) -> Self {

        return self.init(from: nil,
                         by: nil,
                         to: to?.keyValue,
                         duration: duration,
                         animationProperties: otherAnimationProperties,
                         delegate: delegate)
    }

    /// Creates a Descriptor for a Basic Animation
    ///
    /// - Parameters:
    ///   - from: used for the fromValue of the animation
    ///   - by: used for the byValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToBasicAnimations
    ///   - delegate: the animation's delegate
    /// - Returns: a Basic Descriptor object
    public static func from(_ from: T.KeyValueType?,
                            by: T.KeyValueType?,
                            duration: TimeInterval? = nil,
                            otherAnimationProperties: [PropertiesApplicableToBasicAnimations] = [],
                            delegate: CAAnimationDelegate? = nil) -> Self {

        return self.init(from: from?.keyValue,
                         by: by?.keyValue,
                         to: nil,
                         duration: duration,
                         animationProperties: otherAnimationProperties,
                         delegate: delegate)
    }

    /// Creates a Descriptor for a Basic Animation
    ///
    /// - Parameters:
    ///   - from: used for the fromValue of the animation
    ///   - to: used for the toValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToBasicAnimations
    ///   - delegate: the animation's delegate
    /// - Returns: a Basic Descriptor object
    public static func from(_ from: T.KeyValueType?,
                            to: T.KeyValueType?,
                            duration: TimeInterval? = nil,
                            otherAnimationProperties: [PropertiesApplicableToBasicAnimations] = [],
                            delegate: CAAnimationDelegate? = nil) -> Self {

        return self.init(from: from?.keyValue,
                         by: nil,
                         to: to?.keyValue,
                         duration: duration,
                         animationProperties: otherAnimationProperties,
                         delegate: delegate)
    }

    /// Creates a Descriptor for a Basic Animation
    ///
    /// - Parameters:
    ///   - by: used for the byValue of the animation
    ///   - to: used for the toValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToBasicAnimations
    ///   - delegate: the animation's delegate
    /// - Returns: a Basic Descriptor object
    public static func by(_ by: T.KeyValueType?,
                          to: T.KeyValueType?,
                          duration: TimeInterval? = nil,
                          otherAnimationProperties: [PropertiesApplicableToBasicAnimations] = [],
                          delegate: CAAnimationDelegate? = nil) -> Self {

        return self.init(from: nil,
                         by: by?.keyValue,
                         to: to?.keyValue,
                         duration: duration,
                         animationProperties: otherAnimationProperties,
                         delegate: delegate)
    }
}
