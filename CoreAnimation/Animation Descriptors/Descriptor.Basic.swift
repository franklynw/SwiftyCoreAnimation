//
//  Descriptor.Basic.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Descriptor {

    /**
     A Descriptor for creating a CABasicAnimation

     Animate property 'T' - conforming to BaseLayerProperty, KeyValueProviding & Animatable

     ## Usage Example ##
     Create a Descriptor for a Transform.Scale basic animation, & add it to a layer:
     ````
     let scaleDescriptor = Descriptor.Basic<Transform.Scale>.from(0, to: 1, duration: 0.5)
     myShapeLayer.addBasicAnimation(describedBy: scaleDescriptor)
     ````
    */
    public final class Basic<T: BaseLayerProperty & KeyValueProviding & Animatable>: Root, AnimationDescribing {

        private let from: Any?
        private let by: Any?
        private let to: Any?

        
        /// Initializer for a Descriptor for a Basic Animation
        ///
        /// - Parameters:
        ///   - duration: the animation's duration
        ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToBasicAnimations
        public convenience init(duration: TimeInterval? = nil,
                                otherAnimationProperties: [PropertiesApplicableToBasicAnimations] = []) {

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
                         animationProperties: [PropertiesApplicableToBasicAnimations]) {

            self.from = from
            self.by = by
            self.to = to

            super.init(duration: duration, animationProperties: animationProperties, propertyTypes: [T.self])
        }

        /// Creates & returns an instance of the animation described by the class instance
        internal var animation: CAAnimation {

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
    /// - Returns: a Basic Descriptor object
    public static func from(_ from: T.KeyValueType?,
                            duration: TimeInterval? = nil,
                            otherAnimationProperties: [PropertiesApplicableToBasicAnimations] = []) -> Self {

        return self.init(from: from?.keyValue,
                         by: nil,
                         to: nil,
                         duration: duration,
                         animationProperties: otherAnimationProperties)
    }

    /// Creates a Descriptor for a Basic Animation
    ///
    /// - Parameters:
    ///   - by: used for the byValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToBasicAnimations
    /// - Returns: a Basic Descriptor object
    public static func by(_ by: T.KeyValueType?,
                          duration: TimeInterval? = nil,
                          otherAnimationProperties: [PropertiesApplicableToBasicAnimations] = []) -> Self {

        return self.init(from: nil,
                         by: by?.keyValue,
                         to: nil,
                         duration: duration,
                         animationProperties: otherAnimationProperties)
    }

    /// Creates a Descriptor for a Basic Animation
    ///
    /// - Parameters:
    ///   - to: used for the toValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToBasicAnimations
    /// - Returns: a Basic Descriptor object
    public static func to(_ to: T.KeyValueType?,
                          duration: TimeInterval? = nil,
                          otherAnimationProperties: [PropertiesApplicableToBasicAnimations] = []) -> Self {

        return self.init(from: nil,
                         by: nil,
                         to: to?.keyValue,
                         duration: duration,
                         animationProperties: otherAnimationProperties)
    }

    /// Creates a Descriptor for a Basic Animation
    ///
    /// - Parameters:
    ///   - from: used for the fromValue of the animation
    ///   - by: used for the byValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToBasicAnimations
    /// - Returns: a Basic Descriptor object
    public static func from(_ from: T.KeyValueType?,
                            by: T.KeyValueType?,
                            duration: TimeInterval? = nil,
                            otherAnimationProperties: [PropertiesApplicableToBasicAnimations] = []) -> Self {

        return self.init(from: from?.keyValue,
                         by: by?.keyValue,
                         to: nil,
                         duration: duration,
                         animationProperties: otherAnimationProperties)
    }

    /// Creates a Descriptor for a Basic Animation
    ///
    /// - Parameters:
    ///   - from: used for the fromValue of the animation
    ///   - to: used for the toValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToBasicAnimations
    /// - Returns: a Basic Descriptor object
    public static func from(_ from: T.KeyValueType?,
                            to: T.KeyValueType?,
                            duration: TimeInterval? = nil,
                            otherAnimationProperties: [PropertiesApplicableToBasicAnimations] = []) -> Self {

        return self.init(from: from?.keyValue,
                         by: nil,
                         to: to?.keyValue,
                         duration: duration,
                         animationProperties: otherAnimationProperties)
    }

    /// Creates a Descriptor for a Basic Animation
    ///
    /// - Parameters:
    ///   - by: used for the byValue of the animation
    ///   - to: used for the toValue of the animation
    ///   - duration: the animation's duration
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToBasicAnimations
    /// - Returns: a Basic Descriptor object
    public static func by(_ by: T.KeyValueType?,
                          to: T.KeyValueType?,
                          duration: TimeInterval? = nil,
                          otherAnimationProperties: [PropertiesApplicableToBasicAnimations] = []) -> Self {

        return self.init(from: nil,
                         by: by?.keyValue,
                         to: to?.keyValue,
                         duration: duration,
                         animationProperties: otherAnimationProperties)
    }
}
