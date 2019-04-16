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
    ///   - animationDidFinish: invoked when the animation completes
    public func addAnimation(_ animation: CAPropertyAnimation,
                             forKey key: String? = nil,
                             removeExistingAnimations: Bool = false,
                             animationDidFinish: AnimationDidFinishAction? = nil) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)
        CALayer.addAnimationDidFinishAction(animationDidFinish, to: animation)
        self.add(animation, forKey: key ?? self.defaultKey)
    }

    /// Adds a CATransition to the layer
    ///
    /// - Parameters:
    ///   - transition: a CATransition object
    ///   - key: key for the animation
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationDidFinish: invoked when the animation completes
    public func addTransition(_ transition: CATransition,
                              forKey key: String? = nil,
                              removeExistingAnimations: Bool = false,
                              animationDidFinish: AnimationDidFinishAction? = nil) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)
        CALayer.addAnimationDidFinishAction(animationDidFinish, to: transition)
        self.add(transition, forKey: key ?? self.defaultKey)
    }
}


extension CALayer {

    private var defaultKey: String {
        return UUID().uuidString
    }

    func addAnimation(_ animationDescriptor: Descriptor.Root & AnimationDescribing,
                      removeExistingAnimations: Bool,
                      animationDidFinish: AnimationDidFinishAction?) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)

        let animation: CAAnimation = animationDescriptor.animation

        CALayer.addAnimationDidBeginAction(animationDescriptor.animationDidBegin, to: animation)
        CALayer.addAnimationDidFinishAction(animationDidFinish, to: animation)
        CALayer.addAnimationDidFinishAction(animationDescriptor.animationDidFinish, to: animation)

        animationDescriptor.animationWillBegin?()

        self.add(animation, forKey: animationDescriptor.animationKey ?? self.defaultKey)
    }

    func addAnimationsGroup(_ animationDescriptor: Descriptor.Group,
                            removeExistingAnimations: Bool,
                            animationDidFinish: AnimationDidFinishAction?) {

        if let animationDescriptor = animationDescriptor as? Descriptor.Group.Concurrent {
            self.addConcurrentAnimations(animationDescriptor,
                                         removeExistingAnimations: removeExistingAnimations,
                                         animationDidFinish: animationDidFinish)
        } else {
            self.addAnimationSequence([animationDescriptor],
                                      removeExistingAnimations: removeExistingAnimations,
                                      animationDidFinish: animationDidFinish)
        }
    }

    func addAnimationSequence(_ animationDescriptors: [Descriptor.Root],
                              removeExistingAnimations: Bool,
                              animationDidFinish: AnimationDidFinishAction?) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)

        var descriptors = animationDescriptors

        // if any of the descriptors are for actions, we want to carry them out straight away,
        // in the animationDidFinish closure of the previous animation in the sequence;
        // we'd also remove their descriptors when we do this so they're not repeated

        while let nextActionDescriptor = descriptors.first as? Descriptor.Action {
            nextActionDescriptor.action()
            descriptors.removeFirst()
        }

        // the first descriptor for an actual animation (or group)
        guard let descriptor = descriptors.first else {
            // we've run out of items on the group
            animationDidFinish?(nil, true)
            return
        }

        descriptors.removeFirst() // we don't want it in the list any more

        if let concurrentAnimationsDescriptor = descriptor as? Descriptor.Group.Concurrent {

            self.addConcurrentAnimations(concurrentAnimationsDescriptor,
                                         removeExistingAnimations: removeExistingAnimations,
                                         animationDidFinish: { [weak self] _, _ in

                guard let self = self else { return }
                self.addAnimationSequence(descriptors,
                                          removeExistingAnimations: removeExistingAnimations,
                                          animationDidFinish: animationDidFinish)
            })

        } else if let sequentialAnimationsDescriptor = descriptor as? Descriptor.Group.Sequential {

            descriptor.animationWillBegin?() // the sequence always begins now, with no option to change the beginTime

            let allDescriptors = sequentialAnimationsDescriptor.descriptors + descriptors
            self.addAnimationSequence(allDescriptors,
                                      removeExistingAnimations: removeExistingAnimations,
                                      animationDidFinish: { animation, finished in

                animationDidFinish?(animation, finished)
                descriptor.animationDidFinish?(animation, finished)
            })

        } else if let animationDescriptor = descriptor as? AnimationDescribing {
            // in this case it's a normal animation

            let animation = animationDescriptor.animation

            CALayer.addAnimationDidBeginAction(animationDescriptor.animationDidBegin, to: animation)

            animation.addAnimationDidFinishAction { [weak self] animation, finished in
                guard let self = self else { return }
                self.addAnimationSequence(descriptors,
                                          removeExistingAnimations: removeExistingAnimations,
                                          animationDidFinish: animationDidFinish)

                descriptor.animationDidFinish?(animation, finished)
            }

            descriptor.animationWillBegin?()

            self.add(animation, forKey: animationDescriptor.animationKey)
        }
    }

    func addConcurrentAnimations(_ animationDescriptor: Descriptor.Group.Concurrent,
                                 removeExistingAnimations: Bool,
                                 animationDidFinish: AnimationDidFinishAction?) {

        self.removeExistingAnimationsIfNecessary(removeExistingAnimations)

        animationDescriptor.animationWillBegin?()

        let descriptors = animationDescriptor.descriptors

        let groupDuration: TimeInterval? = animationDescriptor.duration
        var animationFinishedActionAdded = false
        var actionCount = 0

        // as we're re-creating CAAnimationGroup functionality, without creating a CAAnimationGroup, we need to handle any animationFinished actions
        // to do this we add it to the longest (including beginTime) of the group's animations, so it's only run once

        descriptors.forEach { descriptor in

            if let actionDescriptor = descriptor as? Descriptor.Action {
                actionDescriptor.action()
                actionCount += 1
                return
            }

            var animationFinishedAction: AnimationDidFinishAction? = nil
            var animationDescriptorFinishedAction: AnimationDidFinishAction? = nil

            if let concurrentAnimationsDescriptor = descriptor as? Descriptor.Group.Concurrent {

                if animationFinishedActionAdded == false, let thisDuration = concurrentAnimationsDescriptor.duration, let groupDuration = groupDuration, thisDuration >= groupDuration {
                    animationFinishedActionAdded = true
                    animationFinishedAction = animationDidFinish // this is the action passed into this function
                    animationDescriptorFinishedAction = animationDescriptor.animationDidFinish // this is the action added when the descriptor was created
                }
                self.addConcurrentAnimations(concurrentAnimationsDescriptor,
                                             removeExistingAnimations: removeExistingAnimations,
                                             animationDidFinish: { [animationFinishedAction, animationDescriptorFinishedAction] animation, finished in

                    // these next two are invoked only if they haven't already been used
                    animationFinishedAction?(animation, finished)
                    animationDescriptorFinishedAction?(animation, finished)
                })

            } else if let sequentialAnimationsDescriptor = descriptor as? Descriptor.Group.Sequential {

                if animationFinishedActionAdded == false, let thisDuration = sequentialAnimationsDescriptor.duration, let groupDuration = groupDuration, thisDuration >= groupDuration {
                    animationFinishedActionAdded = true
                    animationFinishedAction = animationDidFinish // this is the action passed into this function
                    animationDescriptorFinishedAction = animationDescriptor.animationDidFinish // this is the action added when the descriptor was created
                }
                self.addAnimationSequence(sequentialAnimationsDescriptor.descriptors,
                                          removeExistingAnimations: removeExistingAnimations,
                                          animationDidFinish: { [animationFinishedAction, animationDescriptorFinishedAction] animation, finished in

                    descriptor.animationDidFinish?(animation, finished) // each descriptor in the group can have its own animationFinished action

                    // these next two are invoked only if they haven't already been used
                    animationFinishedAction?(animation, finished)
                    animationDescriptorFinishedAction?(animation, finished)
                })

            } else if let singleAnimationDescriptor = descriptor as? AnimationDescribing {

                let animation = singleAnimationDescriptor.animation

                CALayer.addAnimationDidBeginAction(singleAnimationDescriptor.animationDidBegin, to: animation)
                CALayer.addAnimationDidFinishAction(descriptor.animationDidFinish, to: animation)

                // if it's the longest animation in the group, we add the group's animationFinished action to it (only if they haven't already been used)
                if animationFinishedActionAdded == false, let groupDuration = groupDuration, animation.duration + animation.beginTime >= groupDuration {
                    animationFinishedActionAdded = true
                    CALayer.addAnimationDidFinishAction(animationDidFinish, to: animation)
                    CALayer.addAnimationDidFinishAction(animationDescriptor.animationDidFinish, to: animation)
                }

                descriptor.animationWillBegin?()

                self.add(animation, forKey: singleAnimationDescriptor.animationKey)
            }
        }

        if actionCount == descriptors.count { // it was only actions & no animations, so invoke the animationFinished closures
            animationDidFinish?(nil, true)
            animationDescriptor.animationDidFinish?(nil, true)
        }
    }

    private func removeExistingAnimationsIfNecessary(_ removeExistingAnimations: Bool) {
        if removeExistingAnimations {
            self.removeAllAnimations()
        }
    }

    private static func addAnimationDidBeginAction(_ action: AnimationBeginAction?, to animation: CAAnimation) {
        if let action = action {
            animation.addAnimationDidBeginAction(action)
        }
    }

    private static func addAnimationDidFinishAction(_ action: AnimationDidFinishAction?, to animation: CAAnimation) {
        if let action = action {
            animation.addAnimationDidFinishAction(action)
        }
    }
}
