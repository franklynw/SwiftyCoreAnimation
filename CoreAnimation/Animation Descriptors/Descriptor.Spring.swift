//
//  Descriptor.Spring.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Descriptor {

    /**
     A Descriptor for creating a CASpringAnimation

     Animate property 'T' - conforming to BaseLayerProperty, KeyValueProviding & Animatable

     ## Usage Example ##
     Create a Descriptor for a Transform.Scale spring animation, & add it to a layer:
     ````
     let stretchDescriptor = Descriptor.Spring<Transform.Scale>.from(1, to: 2, duration: 0.5)
     myLayer.addSpringAnimation(describedBy: stretchDescriptor)
     ````
    */
    public final class Spring<T: BaseLayerProperty & KeyValueProviding & Animatable>: Root, AnimationDescribing {

        private let from: Any?
        private let by: Any?
        private let to: Any?

        internal var animationKey: String?
        public var animationDidBegin: AnimationBeginAction?


        /// Initializer for a Descriptor for a Spring Animation
        ///
        /// - Parameters:
        ///   - duration: the animation's duration
        ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToSpringAnimations
        ///   - key: the animation's key when added to the CALayer
        public convenience init(duration: TimeInterval? = nil,
                                otherAnimationProperties: [PropertiesApplicableToSpringAnimations] = [],
                                key: String? = nil) {

            self.init(from: nil,
                      by: nil,
                      to: nil,
                      duration: duration,
                      animationProperties: otherAnimationProperties,
                      key: key)
        }

        fileprivate init(from: Any?,
                         by: Any?,
                         to: Any?,
                         duration: TimeInterval?,
                         animationProperties: [PropertiesApplicableToSpringAnimations],
                         key: String?) {

            self.from = from
            self.by = by
            self.to = to
            self.animationKey = key

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
    ///   - key: the animation's key when added to the CALayer
    /// - Returns: a Spring Descriptor object
    public static func from(_ from: T.KeyValueType?,
                            duration: TimeInterval? = nil,
                            otherAnimationProperties: [PropertiesApplicableToSpringAnimations] = [],
                            key: String? = nil) -> Self {

        return self.init(from: from?.keyValue,
                         by: nil,
                         to: nil,
                         duration: duration,
                         animationProperties: otherAnimationProperties,
                         key: key)
    }

    /// Creates a Descriptor for a Spring Animation
    ///
    /// - Parameters:
    ///   - by: used for the byValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToSpringAnimations
    ///   - key: the animation's key when added to the CALayer
    /// - Returns: a Spring Descriptor object
    public static func by(_ by: T.KeyValueType?,
                          duration: TimeInterval? = nil,
                          otherAnimationProperties: [PropertiesApplicableToSpringAnimations] = [],
                          key: String? = nil) -> Self {

        return self.init(from: nil,
                         by: by?.keyValue,
                         to: nil,
                         duration: duration,
                         animationProperties: otherAnimationProperties,
                         key: key)
    }

    /// Creates a Descriptor for a Spring Animation
    ///
    /// - Parameters:
    ///   - to: used for the toValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToSpringAnimations
    ///   - key: the animation's key when added to the CALayer
    /// - Returns: a Spring Descriptor object
    public static func to(_ to: T.KeyValueType?,
                          duration: TimeInterval? = nil,
                          otherAnimationProperties: [PropertiesApplicableToSpringAnimations] = [],
                          key: String? = nil) -> Self {

        return self.init(from: nil,
                         by: nil,
                         to: to?.keyValue,
                         duration: duration,
                         animationProperties: otherAnimationProperties,
                         key: key)
    }

    /// Creates a Descriptor for a Spring Animation
    ///
    /// - Parameters:
    ///   - from: used for the fromValue of the animation
    ///   - to: used for the toValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToSpringAnimations
    ///   - key: the animation's key when added to the CALayer
    /// - Returns: a Spring Descriptor object
    public static func from(_ from: T.KeyValueType?,
                            to: T.KeyValueType?,
                            duration: TimeInterval? = nil,
                            otherAnimationProperties: [PropertiesApplicableToSpringAnimations] = [],
                            key: String? = nil) -> Self {

        return self.init(from: from?.keyValue,
                         by: nil,
                         to: to?.keyValue,
                         duration: duration,
                         animationProperties: otherAnimationProperties,
                         key: key)
    }

    /// Creates a Descriptor for a Spring Animation
    ///
    /// - Parameters:
    ///   - from: used for the fromValue of the animation
    ///   - by: used for the byValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToSpringAnimations
    ///   - key: the animation's key when added to the CALayer
    /// - Returns: a Spring Descriptor object
    public static func from(_ from: T.KeyValueType?,
                            by: T.KeyValueType?,
                            duration: TimeInterval? = nil,
                            otherAnimationProperties: [PropertiesApplicableToSpringAnimations] = [],
                            key: String? = nil) -> Self {

        return self.init(from: from?.keyValue,
                         by: by?.keyValue,
                         to: nil,
                         duration: duration,
                         animationProperties: otherAnimationProperties,
                         key: key)
    }

    /// Creates a Descriptor for a Spring Animation
    ///
    /// - Parameters:
    ///   - by: used for the byValue of the animation
    ///   - to: used for the toValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToSpringAnimations
    ///   - key: the animation's key when added to the CALayer
    /// - Returns: a Spring Descriptor object
    public static func by(_ by: T.KeyValueType?,
                          to: T.KeyValueType?,
                          duration: TimeInterval? = nil,
                          otherAnimationProperties: [PropertiesApplicableToSpringAnimations] = [],
                          key: String? = nil) -> Self {

        return self.init(from: nil,
                         by: by?.keyValue,
                         to: to?.keyValue,
                         duration: duration,
                         animationProperties: otherAnimationProperties,
                         key: key)
    }
}
