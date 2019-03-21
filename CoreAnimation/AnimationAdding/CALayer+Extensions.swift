//
//  AnimationAdding.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


public extension CALayer {

    /// Adds a CABasicAnimation to the layer
    ///
    /// - Parameters:
    ///   - animation: a CABasicAnimation object
    ///   - key: key for the animation
    ///   - properties: an array of Descriptor.Properties applicable to CAPropertyAnimations
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationFinished: invoked when the animation completes
    public func addBasicAnimation(_ animation: CABasicAnimation,
                                  forKey key: String? = nil,
                                  applyingOtherProperties properties: [PropertiesApplicableToBasicAnimations] = [],
                                  removeExistingAnimations: Bool = false,
                                  animationFinished: AnimationFinishedAction? = nil) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)
        CALayer.applyProperties(properties, to: animation)
        CALayer.addAnimationFinishedAction(animationFinished, to: animation)
        self.add(animation, forKey: key ?? self.defaultKey)
    }

    /// Adds a CAKeyFrameAnimation to the layer
    ///
    /// - Parameters:
    ///   - animation: a CAKeyFrameAnimation object
    ///   - key: key for the animation
    ///   - properties: an array of Descriptor.Properties applicable to CAKeyFrameAnimations
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationFinished: invoked when the animation completes
    public func addKeyFrameAnimation(_ animation: CAKeyframeAnimation,
                                     forKey key: String? = nil,
                                     applyingOtherProperties properties: [PropertiesApplicableToKeyFrameAnimations] = [],
                                     removeExistingAnimations: Bool = false,
                                     animationFinished: AnimationFinishedAction? = nil) {
        
        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)
        CALayer.applyProperties(properties, to: animation)
        CALayer.addAnimationFinishedAction(animationFinished, to: animation)
        self.add(animation, forKey: key ?? self.defaultKey)
    }

    /// Adds a CASpringAnimation to the layer
    ///
    /// - Parameters:
    ///   - animation: a CASpringAnimation object
    ///   - key: key for the animation
    ///   - properties: an array of Descriptor.Properties applicable to CASpringAnimations
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationFinished: invoked when the animation completes
    public func addSpringAnimation(_ animation: CASpringAnimation,
                                   forKey key: String? = nil,
                                   applyingOtherProperties properties: [PropertiesApplicableToSpringAnimations] = [],
                                   removeExistingAnimations: Bool = false,
                                   animationFinished: AnimationFinishedAction? = nil) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)
        CALayer.applyProperties(properties, to: animation)
        CALayer.addAnimationFinishedAction(animationFinished, to: animation)
        self.add(animation, forKey: key ?? self.defaultKey)
    }
}


extension CALayer {

    private var defaultKey: String {
        return UUID().uuidString
    }

    func addBasicAnimation<T: BaseLayerProperty>(_ animationDescriptor: Descriptor.Basic<T>,
                                                 forKey key: String?,
                                                 applyingProperties properties: [AnimationPropertiesApplicable],
                                                 removeExistingAnimations: Bool,
                                                 animationFinished: AnimationFinishedAction?) -> CABasicAnimation {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)
        let animation = animationDescriptor.animation
        CALayer.applyProperties(properties, to: animation)
        CALayer.addAnimationFinishedAction(animationFinished, to: animation)
        self.add(animation, forKey: key ?? self.defaultKey)

        return animation
    }

    func addKeyFrameAnimation<T: BaseLayerProperty>(_ animationDescriptor: Descriptor.KeyFrame<T>,
                                                    forKey key: String?,
                                                    applyingProperties properties: [AnimationPropertiesApplicable],
                                                    removeExistingAnimations: Bool,
                                                    animationFinished: AnimationFinishedAction?) -> CAKeyframeAnimation {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)
        let animation: CAKeyframeAnimation = animationDescriptor.animation
        CALayer.applyProperties(properties, to: animation)
        CALayer.addAnimationFinishedAction(animationFinished, to: animation)
        self.add(animation, forKey: key ?? self.defaultKey)

        return animation
    }

    func addSpringAnimation<T: BaseLayerProperty>(_ animationDescriptor: Descriptor.Spring<T>,
                                                  forKey key: String?,
                                                  applyingProperties properties: [AnimationPropertiesApplicable],
                                                  removeExistingAnimations: Bool,
                                                  animationFinished: AnimationFinishedAction?) -> CASpringAnimation {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)
        let animation: CASpringAnimation = animationDescriptor.animation
        CALayer.applyProperties(properties, to: animation)
        CALayer.addAnimationFinishedAction(animationFinished, to: animation)
        self.add(animation, forKey: key ?? self.defaultKey)

        return animation
    }

    func addTransition(_ transitionDescriptor: Descriptor.Transition,
                       forKey key: String?,
                       applyingProperties properties: [AnimationPropertiesApplicable],
                       removeExistingAnimations: Bool,
                       animationFinished: AnimationFinishedAction?) -> CATransition {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)
        let transition: CATransition = transitionDescriptor.animation
        CALayer.applyProperties(properties, to: transition)
        CALayer.addAnimationFinishedAction(animationFinished, to: transition)
        self.add(transition, forKey: key ?? self.defaultKey)

        return transition
    }

    func addAnimationsGroup(_ animationDescriptor: Descriptor.Group,
                            forKey key: String?,
                            applyingProperties properties: [AnimationPropertiesApplicable],
                            removeExistingAnimations: Bool,
                            animationFinished: AnimationFinishedAction?) -> CAAnimation? {

        if animationDescriptor.isConcurrent {
            return self.addConcurrentAnimationsGroup([animationDescriptor],
                                                     forKey: key,
                                                     duration: animationDescriptor.duration,
                                                     applyingProperties: properties,
                                                     removeExistingAnimations: removeExistingAnimations,
                                                     animationFinished: animationFinished)
        } else {
            return self.addAnimationSequence([animationDescriptor],
                                             forKey: key,
                                             applyingProperties: properties,
                                             removeExistingAnimations: removeExistingAnimations,
                                             animationFinished: animationFinished)
        }
    }

    func addConcurrentAnimationsGroup(_ animationDescriptors: [Descriptor.Root],
                                      forKey key: String?,
                                      duration: TimeInterval?,
                                      applyingProperties properties: [AnimationPropertiesApplicable],
                                      removeExistingAnimations: Bool,
                                      animationFinished: AnimationFinishedAction?) -> CAAnimationGroup {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)

        var descriptors = animationDescriptors

        repeat {
            let descriptor = descriptors.first
            if let actionDescriptor = descriptor as? Descriptor.Action {
                actionDescriptor.action()
                descriptors.removeFirst()
            } else if let groupDescriptor = descriptor as? Descriptor.Group {
                if groupDescriptor.isConcurrent {
                    _ = self.addConcurrentAnimationsGroup([groupDescriptor], forKey: key, duration: duration, applyingProperties: properties, removeExistingAnimations: removeExistingAnimations, animationFinished: nil)
                } else {
                    _ = self.addAnimationSequence([groupDescriptor], forKey: key, applyingProperties: properties, removeExistingAnimations: removeExistingAnimations, animationFinished: nil)
                }
                descriptors.removeFirst()
            }
        } while descriptors.first is Descriptor.Action || descriptors.first is Descriptor.Group

        let groupAnimations: [CAAnimation]

        // if we've used up the descriptors because they were all actions & group descriptors, we'll need to add a dummy animation for the animationFinished action
        if descriptors.isEmpty, animationFinished != nil {
            let animation: CABasicAnimation = CABasicAnimation(keyPath: AnimationActions.animationKey)
            animation.fromValue = 0
            animation.toValue = 1
            groupAnimations = [animation]
        } else {
            groupAnimations = descriptors.compactMap { $0.animation }
        }

        let animationGroup: CAAnimationGroup = CAAnimationGroup()
        animationGroup.animations = groupAnimations

        if let duration = duration {
            animationGroup.duration = duration
        }

        CALayer.applyProperties(properties, to: animationGroup)
        CALayer.addAnimationFinishedAction(animationFinished, to: animationGroup)

        self.add(animationGroup, forKey: key ?? self.defaultKey)

        return animationGroup
    }

    func addAnimationSequence(_ animationDescriptors: [Descriptor.Root],
                              forKey key: String?,
                              applyingProperties properties: [AnimationPropertiesApplicable],
                              removeExistingAnimations: Bool,
                              animationFinished: AnimationFinishedAction?) -> CAAnimation? {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)

        var descriptors = animationDescriptors

        func performActions() {

            var actions: [() -> ()] = []
            repeat {
                if let nextActionDescriptor = descriptors.first as? Descriptor.Action {
                    actions.append(nextActionDescriptor.action)
                    descriptors.removeFirst()
                }
            } while descriptors.first is Descriptor.Action

            actions.forEach { $0() }
        }

        // just in case the consumer has put actions at the start of the array, we need to execute them immediately
        performActions()

        guard var descriptor = descriptors.first else { return nil }

        // if we're adding another sedquential animation, build it up from its descriptors
        if let sequentialAnimationDescriptor = descriptor as? Descriptor.Group, sequentialAnimationDescriptor.isConcurrent == false {
            descriptors = sequentialAnimationDescriptor.descriptors + descriptors
            performActions() // again, check that the start of the sequence isn't an action(s)
            guard let firstDescriptor = descriptors.first else { return nil }
            descriptor = firstDescriptor
        }

        descriptors.removeFirst()
        let animation = descriptor.animation

        CALayer.applyProperties(properties, to: animation)

        animation.addAnimationFinishedAction { [weak self] _, _ in
            performActions()
            if self?.addAnimationSequence(descriptors, forKey: key, applyingProperties: properties, removeExistingAnimations: removeExistingAnimations, animationFinished: animationFinished) == nil {
                animationFinished?(animation, true)
            }
        }

        self.add(animation, forKey: key)

        return animation
    }

    static func concurrentAnimationsGroup(_ animationDescriptors: [Descriptor.Root],
                                          forKey key: String?,
                                          duration: TimeInterval?,
                                          applyingProperties properties: [AnimationPropertiesApplicable],
                                          animationFinished: AnimationFinishedAction?) -> CAAnimationGroup {

        let groupAnimations: [CAAnimation] = animationDescriptors.compactMap { $0.animation }

        let animationGroup: CAAnimationGroup = CAAnimationGroup()
        animationGroup.animations = groupAnimations

        if let duration = duration {
            animationGroup.duration = duration
        }

        CALayer.applyProperties(properties, to: animationGroup)
        CALayer.addAnimationFinishedAction(animationFinished, to: animationGroup)

        return animationGroup
    }

    private func removeExistingAnimationsIfNecessary(_ removeExistingAnimations: Bool) {
        if removeExistingAnimations {
            self.removeAllAnimations()
        }
    }

    private static func addAnimationFinishedAction(_ completion: AnimationFinishedAction?, to animation: CAAnimation) {
        if let completion = completion {
            animation.addAnimationFinishedAction(completion)
        }
    }

    private static func applyProperties(_ properties: [AnimationPropertiesApplicable], to animation: CAAnimation) {
        properties.forEach {
            ($0 as? InternalAnimationPropertiesApplying)?.applyProperty(to: animation)
        }
    }
}
