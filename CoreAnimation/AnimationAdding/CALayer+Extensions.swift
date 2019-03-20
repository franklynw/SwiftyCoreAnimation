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
                            animationFinished: AnimationFinishedAction?) -> CAAnimationGroup {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)

        let animationGroup: CAAnimationGroup = animationDescriptor.animation

        var beginTime: TimeInterval = 0
        animationGroup.animations?.forEach { animation in
            if let animation = animation as? CABasicAnimation, animation.keyPath == AnimationActions.animationKey {
                if let action = animation.value(forKeyPath: AnimationActions.animationActionKey) as? () -> () {
                    AnimationActions.addActionAnimation(animation, to: self, beginTime: beginTime, action: action)
                }
            }
            beginTime += animation.duration
        }

        CALayer.applyProperties(properties, to: animationGroup)
        CALayer.addAnimationFinishedAction(animationFinished, to: animationGroup)

        self.add(animationGroup, forKey: key ?? self.defaultKey)

        return animationGroup
    }

    func addConcurrentAnimationsGroup(_ animationDescriptors: [Descriptor.Root],
                                      forKey key: String?,
                                      duration: TimeInterval?,
                                      applyingProperties properties: [AnimationPropertiesApplicable],
                                      removeExistingAnimations: Bool,
                                      animationFinished: AnimationFinishedAction?) -> CAAnimationGroup {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)

        let animationGroup: CAAnimationGroup = CALayer.concurrentAnimationsGroup(animationDescriptors,
                                                                                 forKey: key,
                                                                                 duration: duration,
                                                                                 applyingProperties: properties,
                                                                                 animationFinished: animationFinished)

        self.add(animationGroup, forKey: key ?? self.defaultKey)

        return animationGroup
    }

    func addSequentialAnimations(_ animationDescriptors: [Descriptor.Root],
                                 forKey key: String?,
                                 applyingProperties properties: [AnimationPropertiesApplicable],
                                 removeExistingAnimations: Bool,
                                 animationFinished: AnimationFinishedAction?) -> CAAnimation? {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)

        var descriptors = animationDescriptors

        func addAnimation() -> CAAnimation? {
            guard let descriptor = descriptors.first else { return nil }

            descriptors.removeFirst()
            let animation = descriptor.animation

            CALayer.applyProperties(properties, to: animation)

            var actions: [() -> ()] = []
            repeat {
                if let nextActionDescriptor = descriptors.first as? Descriptor.Action {
                    actions.append(nextActionDescriptor.action)
                    descriptors.removeFirst()
                }
            } while descriptors.first is Descriptor.Action

            if let nextAnimation = addAnimation() {
                animation.addAnimationFinishedAction { _, _ in
                    actions.forEach { $0() }
                    self.add(nextAnimation, forKey: key)
                }
            } else if let animationFinished = animationFinished {
                animation.addAnimationFinishedAction(animationFinished)
            }

            return animation
        }

        if let animation = addAnimation() {
            self.add(animation, forKey: key)
            return animation
        }

        return nil
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

    static func sequentialAnimationsGroup(_ animationDescriptors: [Descriptor.Root],
                                          forKey key: String?,
                                          applyingProperties properties: [AnimationPropertiesApplicable],
                                          animationFinished: AnimationFinishedAction?) -> CAAnimationGroup {

        var beginTime: TimeInterval = 0
        let groupAnimations: [CAAnimation] = animationDescriptors.compactMap { animationDescriptor in

            let animation = animationDescriptor.animation

            animation.beginTime = beginTime
            beginTime += animation.duration

            return animation
        }

        let animationGroup: CAAnimationGroup = CAAnimationGroup()
        animationGroup.animations = groupAnimations
        animationGroup.duration = beginTime

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
