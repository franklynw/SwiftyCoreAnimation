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
                            removeExistingAnimations: Bool,
                            animationFinished: AnimationFinishedAction?) {

        if let animationDescriptor = animationDescriptor as? Descriptor.Group.Concurrent {
            self.addConcurrentAnimationsGroup(animationDescriptor,
                                              forKey: key,
                                              removeExistingAnimations: removeExistingAnimations,
                                              animationFinished: animationFinished)
        } else {
            self.addAnimationSequence([animationDescriptor],
                                      forKey: key,
                                      removeExistingAnimations: removeExistingAnimations,
                                      animationFinished: animationFinished)
        }
    }

    func addAnimationSequence(_ animationDescriptors: [Descriptor.Root],
                              forKey key: String?,
                              removeExistingAnimations: Bool,
                              animationFinished: AnimationFinishedAction?) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)

        var descriptors = animationDescriptors

        // if any of the descriptors are for actions, we want to carry them out straight away,
        // in the animationFinished closure of the previous animation in the sequence;
        // we'd also remove their descriptors when we do this so they're not repeated

        while let nextActionDescriptor = descriptors.first as? Descriptor.Action {
            nextActionDescriptor.action()
            descriptors.removeFirst()
        }

        // the first descriptor for an actual animation (or group)
        guard let descriptor = descriptors.first else {
            // we've run out of items on the group
            animationFinished?(nil, true)
            return
        }

        descriptors.removeFirst() // we don't want it in the list any more

        if let concurrentAnimationsDescriptor = descriptor as? Descriptor.Group.Concurrent {

            self.addConcurrentAnimationsGroup(concurrentAnimationsDescriptor, forKey: key, removeExistingAnimations: removeExistingAnimations, animationFinished: { [weak self] _, _ in
                guard let self = self else { return }
                self.addAnimationSequence(descriptors, forKey: key, removeExistingAnimations: removeExistingAnimations, animationFinished: animationFinished)
            })

        } else if let sequentialAnimationsDescriptor = descriptor as? Descriptor.Group.Sequence {

            let allDescriptors = sequentialAnimationsDescriptor.descriptors + descriptors
            self.addAnimationSequence(allDescriptors, forKey: key, removeExistingAnimations: removeExistingAnimations, animationFinished: animationFinished)

        } else {
            // in this case it's a normal animation

            let animation = descriptor.animation

            animation.addAnimationFinishedAction { [weak self] _, _ in
                guard let self = self else { return }
                self.addAnimationSequence(descriptors, forKey: key, removeExistingAnimations: removeExistingAnimations, animationFinished: animationFinished)
            }

            self.add(animation, forKey: key)
        }
    }

    func addConcurrentAnimationsGroup(_ animationDescriptor: Descriptor.Group.Concurrent,
                                      forKey key: String?,
                                      removeExistingAnimations: Bool,
                                      animationFinished: AnimationFinishedAction?) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)

        var descriptors = animationDescriptor.descriptors
        var descriptorsToRemove: [Int] = []

        descriptors.enumerated().forEach { pair in
            if let descriptor = pair.element as? Descriptor.Action {
                descriptor.action()
                descriptorsToRemove.append(pair.offset)
            }
        }

        descriptorsToRemove.reversed().forEach {
            descriptors.remove(at: $0)
        }

        if descriptors.isEmpty {
            // we've run out of items on the group
            animationFinished?(nil, true)
            return
        }

        let groupDescriptors: [Descriptor.Group] = descriptors.compactMap { $0 as? Descriptor.Group }

        // if we have only group descriptors, we just add the groups - they're not actual 'animations',
        // but animations with completion closures which begin the next animation
        // this doesn't play well with CAAnimationGroups, which are actually collections of CAAnimations,
        // which have a duration of their own. In the case of having only sequences, the groups 'duration' property
        // is meaningless. If we have a combination of sequences & other animations, the duration is used,
        // (& any animationFinished action) but this can end up being before or after the end of any sequence
        // We also have the problem of what to do with the 'animationFinished' if we have only sequences -
        // currently the logic is to trigger it after the first sequence (maybe better after shortest? longest?)
        let isOnlyGroups = groupDescriptors.count == descriptors.count

        if isOnlyGroups {

            var animationFinishedAction: AnimationFinishedAction? = animationFinished
            groupDescriptors.forEach { descriptor in
                if let descriptor = descriptor as? Descriptor.Group.Concurrent {
                    self.addConcurrentAnimationsGroup(descriptor, forKey: key, removeExistingAnimations: removeExistingAnimations, animationFinished: animationFinishedAction)
                } else if let descriptor = descriptor as? Descriptor.Group.Sequence {
                    self.addAnimationSequence(descriptor.descriptors, forKey: key, removeExistingAnimations: removeExistingAnimations, animationFinished: animationFinishedAction)
                }
                animationFinishedAction = nil
            }

        } else {

            let animations: [CAAnimation] = descriptors.compactMap { descriptor -> CAAnimation? in
                if let concurrentAnimationsDescriptor = descriptor as? Descriptor.Group.Concurrent {
                    self.addConcurrentAnimationsGroup(concurrentAnimationsDescriptor, forKey: key, removeExistingAnimations: removeExistingAnimations, animationFinished: nil)
                    return nil
                } else if let sequentialAnimationsDescriptor = descriptor as? Descriptor.Group.Sequence {
                    self.addAnimationSequence(sequentialAnimationsDescriptor.descriptors, forKey: key, removeExistingAnimations: removeExistingAnimations, animationFinished: nil)
                    return nil
                } else {
                    return descriptor.animation
                }
            }

            let animationGroup: CAAnimationGroup = CAAnimationGroup()
            animationGroup.animations = animations

            animationDescriptor.animationProperties.forEach {
                ($0 as? InternalAnimationPropertiesApplying)?.applyProperty(to: animationGroup)
            }

            if let duration = animationDescriptor.duration {
                animationGroup.duration = duration
            }
            if let animationFinished = animationFinished {
                animationGroup.addAnimationFinishedAction(animationFinished)
            }

            self.add(animationGroup, forKey: key)
        }
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
