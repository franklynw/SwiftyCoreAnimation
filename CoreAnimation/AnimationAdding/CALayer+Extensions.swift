//
//  AnimationAdding.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


// MARK: - Convenience functions to add animations to CALayers
public extension CALayer {

    /// Adds a CAPropertyAnimation (CABasicAnimation, CAKeyframeAnimation, CASpringAnimation) to the layer
    ///
    /// - Parameters:
    ///   - animation: a CAPropertyAnimation object
    ///   - key: key for the animation
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationFinished: invoked when the animation completes
    public func addAnimation(_ animation: CAPropertyAnimation,
                             forKey key: String? = nil,
                             removeExistingAnimations: Bool = false,
                             animationFinished: AnimationFinishedAction? = nil) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)
        CALayer.addAnimationFinishedAction(animationFinished, to: animation)
        self.add(animation, forKey: key ?? self.defaultKey)
    }

    /// Adds a CATransition to the layer
    ///
    /// - Parameters:
    ///   - transition: a CATransition object
    ///   - key: key for the animation
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationFinished: invoked when the animation completes
    public func addTransition(_ transition: CATransition,
                              forKey key: String? = nil,
                              removeExistingAnimations: Bool = false,
                              animationFinished: AnimationFinishedAction? = nil) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)
        CALayer.addAnimationFinishedAction(animationFinished, to: transition)
        self.add(transition, forKey: key ?? self.defaultKey)
    }
}


extension CALayer {

    private var defaultKey: String {
        return UUID().uuidString
    }

    func addAnimation(_ animationDescriptor: Descriptor.Root & AnimationDescribing,
                      forKey key: String?,
                      applyingProperties properties: [AnimationPropertiesApplicable],
                      removeExistingAnimations: Bool,
                      animationFinished: AnimationFinishedAction?) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)

        let animation: CAAnimation = animationDescriptor.animation

        CALayer.applyProperties(properties, to: animation)
        CALayer.addAnimationFinishedAction(animationFinished, to: animation)
        CALayer.addAnimationFinishedAction(animationDescriptor.animationDidFinish, to: animation)

        animationDescriptor.animationWillBegin?()

        self.add(animation, forKey: key ?? self.defaultKey)
    }

    func addAnimationsGroup(_ animationDescriptor: Descriptor.Group,
                            forKey key: String?,
                            removeExistingAnimations: Bool,
                            animationFinished: AnimationFinishedAction?) {

        if let animationDescriptor = animationDescriptor as? Descriptor.Group.Concurrent {
            self.addConcurrentAnimations(animationDescriptor,
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

    /*
     A large part of this function isn't testable by the unit tests, as it has UI dependencies
     TODO: - write UI tests for Animation Sequence groups
    */
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

        descriptor.animationWillBegin?()

        if let concurrentAnimationsDescriptor = descriptor as? Descriptor.Group.Concurrent {

            self.addConcurrentAnimations(concurrentAnimationsDescriptor,
                                         forKey: key,
                                         removeExistingAnimations: removeExistingAnimations,
                                         animationFinished: { [weak self] _, _ in

                guard let self = self else { return }
                self.addAnimationSequence(descriptors,
                                          forKey: key,
                                          removeExistingAnimations: removeExistingAnimations,
                                          animationFinished: { animation, finished in

                    animationFinished?(animation, finished)
                    descriptor.animationDidFinish?(animation, finished)
                })
            })

        } else if let sequentialAnimationsDescriptor = descriptor as? Descriptor.Group.Sequential {

            let allDescriptors = sequentialAnimationsDescriptor.descriptors + descriptors
            self.addAnimationSequence(allDescriptors,
                                      forKey: key,
                                      removeExistingAnimations: removeExistingAnimations,
                                      animationFinished: { animation, finished in

                animationFinished?(animation, finished)
                descriptor.animationDidFinish?(animation, finished)
            })

        } else if let animationDescriptor = descriptor as? AnimationDescribing {
            // in this case it's a normal animation

            let animation = animationDescriptor.animation

            animation.addAnimationFinishedAction { [weak self] animation, finished in
                guard let self = self else { return }
                self.addAnimationSequence(descriptors,
                                          forKey: key,
                                          removeExistingAnimations: removeExistingAnimations,
                                          animationFinished: animationFinished)

                descriptor.animationDidFinish?(animation, finished)
            }

            self.add(animation, forKey: key)
        }
    }

    /*
     A large part of this function isn't testable by the unit tests, as it has UI dependencies
     TODO: - write UI tests for Concurrent Animation groups
     */
    func addConcurrentAnimations(_ animationDescriptor: Descriptor.Group.Concurrent,
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
            var animationDescriptorFinishedAction: AnimationFinishedAction? = animationDescriptor.animationDidFinish

            groupDescriptors.forEach { descriptor in
                if let descriptor = descriptor as? Descriptor.Group.Concurrent {
                    self.addConcurrentAnimations(descriptor,
                                                 forKey: key,
                                                 removeExistingAnimations: removeExistingAnimations,
                                                 animationFinished: { [animationFinishedAction, animationDescriptorFinishedAction] animation, finished in

                        animationDescriptorFinishedAction?(animation, finished)
                        animationFinishedAction?(animation, finished)
                    })
                } else if let descriptor = descriptor as? Descriptor.Group.Sequential {
                    self.addAnimationSequence(descriptor.descriptors,
                                              forKey: key,
                                              removeExistingAnimations: removeExistingAnimations,
                                              animationFinished: { [animationFinishedAction, animationDescriptorFinishedAction] animation, finished in

                        animationDescriptorFinishedAction?(animation, finished)
                        animationFinishedAction?(animation, finished)
                    })
                }
                animationFinishedAction = nil
                animationDescriptorFinishedAction = nil
            }

        } else {

            let animations: [CAAnimation] = descriptors.compactMap { descriptor -> CAAnimation? in
                if let concurrentAnimationsDescriptor = descriptor as? Descriptor.Group.Concurrent {
                    self.addConcurrentAnimations(concurrentAnimationsDescriptor,
                                                 forKey: key,
                                                 removeExistingAnimations: removeExistingAnimations,
                                                 animationFinished: { [animationFinishedAction = descriptor.animationDidFinish] animation, finished in

                        animationFinishedAction?(animation, finished)
                    })
                    return nil
                } else if let sequentialAnimationsDescriptor = descriptor as? Descriptor.Group.Sequential {
                    self.addAnimationSequence(sequentialAnimationsDescriptor.descriptors,
                                              forKey: key,
                                              removeExistingAnimations: removeExistingAnimations,
                                              animationFinished: { [animationFinishedAction = descriptor.animationDidFinish] animation, finished in

                        animationFinishedAction?(animation, finished)
                    })
                    return nil
                } else {
                    return (descriptor as? AnimationDescribing)?.animation
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

            CALayer.addAnimationFinishedAction(animationFinished, to: animationGroup)
            CALayer.addAnimationFinishedAction(animationDescriptor.animationDidFinish, to: animationGroup)

            descriptors.forEach {
                $0.animationWillBegin?()
                CALayer.addAnimationFinishedAction($0.animationDidFinish, to: animationGroup)
            }

            animationDescriptor.animationWillBegin?()

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
