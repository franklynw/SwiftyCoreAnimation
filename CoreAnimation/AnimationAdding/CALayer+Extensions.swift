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
                                                 animationFinished: AnimationFinishedAction?) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)
        let animation = animationDescriptor.animation
        CALayer.applyProperties(properties, to: animation)
        CALayer.addAnimationFinishedAction(animationFinished, to: animation)
        self.add(animation, forKey: key ?? self.defaultKey)
    }

    func addKeyFrameAnimation<T: BaseLayerProperty>(_ animationDescriptor: Descriptor.KeyFrame<T>,
                                                    forKey key: String?,
                                                    applyingProperties properties: [AnimationPropertiesApplicable],
                                                    removeExistingAnimations: Bool,
                                                    animationFinished: AnimationFinishedAction?) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)
        let animation: CAKeyframeAnimation = animationDescriptor.animation
        CALayer.applyProperties(properties, to: animation)
        CALayer.addAnimationFinishedAction(animationFinished, to: animation)
        self.add(animation, forKey: key ?? self.defaultKey)
    }

    func addSpringAnimation<T: BaseLayerProperty>(_ animationDescriptor: Descriptor.Spring<T>,
                                                  forKey key: String?,
                                                  applyingProperties properties: [AnimationPropertiesApplicable],
                                                  removeExistingAnimations: Bool,
                                                  animationFinished: AnimationFinishedAction?) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)
        let animation: CASpringAnimation = animationDescriptor.animation
        CALayer.applyProperties(properties, to: animation)
        CALayer.addAnimationFinishedAction(animationFinished, to: animation)
        self.add(animation, forKey: key ?? self.defaultKey)
    }

    func addTransition(_ transitionDescriptor: Descriptor.Transition,
                       forKey key: String?,
                       applyingProperties properties: [AnimationPropertiesApplicable],
                       removeExistingAnimations: Bool,
                       animationFinished: AnimationFinishedAction?) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)
        let transition: CATransition = transitionDescriptor.animation
        CALayer.applyProperties(properties, to: transition)
        CALayer.addAnimationFinishedAction(animationFinished, to: transition)
        self.add(transition, forKey: key ?? self.defaultKey)
    }

    func addAnimationsGroup(_ animationDescriptor: Descriptor.Group,
                            forKey key: String?,
                            applyingProperties properties: [AnimationPropertiesApplicable],
                            removeExistingAnimations: Bool,
                            animationFinished: AnimationFinishedAction?) {

        if animationDescriptor.isConcurrent {
            self.addConcurrentAnimationsGroup([animationDescriptor],
                                              forKey: key,
                                              duration: animationDescriptor.duration,
                                              applyingProperties: properties,
                                              removeExistingAnimations: removeExistingAnimations,
                                              animationFinished: animationFinished)
        } else {
            self.addAnimationSequence([animationDescriptor],
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
                                      animationFinished: AnimationFinishedAction?) {

        if let animationGroup = self.concurrentAnimationsGroup(animationDescriptors,
                                                               forKey: key,
                                                               duration: duration,
                                                               applyingProperties: properties,
                                                               removeExistingAnimations: removeExistingAnimations,
                                                               animationFinished: animationFinished) {

            if let animationFinished = animationFinished,
                animationDescriptors.isEmpty == false,
                (animationGroup.animations == nil || animationGroup.animations?.isEmpty == true) {

                // the descriptors must have all been group or action descriptors, so they've been handled separately, & not part of this group
                // create a dummy animation with an animationFinished closure
                let animation = self.addAction(duration: duration, action: nil)
                animation.addAnimationFinishedAction(animationFinished)

            } else {
                self.add(animationGroup, forKey: key ?? self.defaultKey)
            }
        }
    }

    @discardableResult
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

        descriptors.removeFirst()

        let animation: CAAnimation?

        if let groupAnimationDescriptor = descriptor as? Descriptor.Group {
            if groupAnimationDescriptor.isConcurrent {
                // if we're adding a group, use the addConcurrentAnimationsGroup function to do it
                animation = self.concurrentAnimationsGroup(groupAnimationDescriptor.descriptors,
                                                           forKey: key,
                                                           duration: groupAnimationDescriptor.duration,
                                                           applyingProperties: properties,
                                                           removeExistingAnimations: removeExistingAnimations,
                                                           animationFinished: nil)
            } else {
                // if we're adding another sedquential animation, build it up from its descriptors
                descriptors = groupAnimationDescriptor.descriptors + descriptors
                performActions() // again, check that the start of the sequence isn't an action(s)
                guard let firstDescriptor = descriptors.first else { return nil }
                descriptor = firstDescriptor
                descriptors.removeFirst()
                animation = descriptor.animation
            }
        } else {
            animation = descriptor.animation
        }

        guard let nextAnimation = animation else {
            return nil
        }

        CALayer.applyProperties(properties, to: nextAnimation)

        nextAnimation.addAnimationFinishedAction { [weak self] _, _ in
            performActions()
            if self?.addAnimationSequence(descriptors, forKey: key, applyingProperties: properties, removeExistingAnimations: removeExistingAnimations, animationFinished: animationFinished) == nil {
                animationFinished?(nextAnimation, true)
            }
        }

        self.add(nextAnimation, forKey: key)

        return nextAnimation
    }

    private func concurrentAnimationsGroup(_ animationDescriptors: [Descriptor.Root],
                                           forKey key: String?,
                                           duration: TimeInterval?,
                                           applyingProperties properties: [AnimationPropertiesApplicable],
                                           removeExistingAnimations: Bool,
                                           animationFinished: AnimationFinishedAction?) -> CAAnimationGroup? {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)

        var descriptors = animationDescriptors
        var descriptorsToRemove: [Int] = []

        descriptors.enumerated().forEach { pair in
            let descriptor = pair.element
            if let actionDescriptor = descriptor as? Descriptor.Action {
                actionDescriptor.action()
                descriptorsToRemove.append(pair.offset)
            } else if let groupDescriptor = descriptor as? Descriptor.Group {
                if groupDescriptor.isConcurrent {
                    self.addConcurrentAnimationsGroup(groupDescriptor.descriptors, forKey: key, duration: duration, applyingProperties: properties, removeExistingAnimations: removeExistingAnimations, animationFinished: nil)
                } else {
                    _ = self.addAnimationSequence([groupDescriptor], forKey: key, applyingProperties: properties, removeExistingAnimations: removeExistingAnimations, animationFinished: nil)
                }
                descriptorsToRemove.append(pair.offset)
            }
        }

        descriptorsToRemove.reversed().forEach {
            descriptors.remove(at: $0)
        }

        let groupAnimations: [CAAnimation]

        // if we've used up the descriptors because they were all actions & group descriptors, we'll need to add a dummy animation for the animationFinished action
        if descriptors.isEmpty {
            if animationFinished != nil {
                let animation: CABasicAnimation = CABasicAnimation(keyPath: "dummy")
                animation.fromValue = 0
                animation.toValue = 1
                groupAnimations = [animation]
            } else {
                return nil
            }
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
