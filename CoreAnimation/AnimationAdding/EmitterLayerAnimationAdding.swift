//
//  EmitterLayerAnimationAdding.swift
//  CoreAnimation
//
//  Created by Franklyn on 21/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


public protocol EmitterLayerAnimationAdding {}

extension CAEmitterLayer: EmitterLayerAnimationAdding {}
public extension EmitterLayerAnimationAdding where Self: CAEmitterLayer {

    /// Set the layer's property using the 'nice' type
    ///
    /// - Parameter property: object conforming to EmitterLayerProperty & KeyValueProviding & KeyPathProviding & Settable
    public func set<T: EmitterLayerProperty & KeyValueProviding & KeyPathProviding & Settable>(_ property: T?) {
        self.setValue(property?.value?.keyValue, forKeyPath: T.keyPath)
    }

    /// Get the layer's value for the specified property
    ///
    /// - Parameter propertyType: conforming to EmitterLayerProperty & KeyValueProviding & KeyPathProviding
    /// - Returns: property as KeyValueType
    public func get<T: EmitterLayerProperty & KeyValueProviding & KeyPathProviding>(_ propertyType: T.Type) -> T.KeyValueType? {
        let value: Any? = self.value(forKeyPath: T.keyPath)
        return T.toKeyValueType(value)
    }

    /// Adds a CABasicAnimation to a CAEmitterLayer
    ///
    /// - Parameters:
    ///   - animationDescriptor: Descriptor.Basic<T> animation descriptor, where T conforms to EmitterLayerProperty
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationDidFinish: invoked when the animation completes
    public func addAnimation<T: EmitterLayerProperty & Animatable>(describedBy animationDescriptor: Descriptor.Basic<T>,
                                                                   removeExistingAnimations: Bool = false,
                                                                   animationDidFinish: AnimationDidFinishAction? = nil) {

        self.addAnimation(animationDescriptor,
                          removeExistingAnimations: removeExistingAnimations,
                          animationDidFinish: animationDidFinish)
    }

    /// Adds a CAKeyFrameAnimation to a CAEmitterLayer
    ///
    /// - Parameters:
    ///   - animationDescriptor: Descriptor.KeyFrame<T> animation descriptor, where T conforms to EmitterLayerProperty
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationDidFinish: invoked when the animation completes
    public func addAnimation<T: EmitterLayerProperty & Animatable>(describedBy animationDescriptor: Descriptor.KeyFrame<T>,
                                                                   removeExistingAnimations: Bool = false,
                                                                   animationDidFinish: AnimationDidFinishAction? = nil) {

        self.addAnimation(animationDescriptor,
                          removeExistingAnimations: removeExistingAnimations,
                          animationDidFinish: animationDidFinish)
    }

    /// Adds a CASpringAnimation to a CAEmitterLayer
    ///
    /// - Parameters:
    ///   - animationDescriptor: Descriptor.Spring<T> animation descriptor, where T conforms to EmitterLayerProperty
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationDidFinish: invoked when the animation completes
    public func addAnimation<T: EmitterLayerProperty & Animatable>(describedBy animationDescriptor: Descriptor.Spring<T>,
                                                                   removeExistingAnimations: Bool = false,
                                                                   animationDidFinish: AnimationDidFinishAction? = nil) {
        
        self.addAnimation(animationDescriptor,
                          removeExistingAnimations: removeExistingAnimations,
                          animationDidFinish: animationDidFinish)
    }

    /// Adds an animation group to a CAEmitterLayer
    /// The animations will run concurrently
    /// throws if any of the descriptors describe animations on properties not applicabale to CAEmitterLayer
    ///
    /// - Parameters:
    ///   - animationDescriptor: a Group Animation descriptor - whether it is concurrent or sequential is determined by the descriptor
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationDidFinish: invoked when the animation completes - any animationDidFinish actions on the individual descriptors will be ignored
    public func addAnimationsGroup(describedBy animationDescriptor: Descriptor.Group,
                                   removeExistingAnimations: Bool = false,
                                   animationDidFinish: AnimationDidFinishAction? = nil) throws {

        try animationDescriptor.propertyTypes.forEach {
            guard $0 is LayerProperty.Type || $0 is EmitterLayerProperty.Type else {
                throw GroupAnimationCreationError.invalidDescriptor(.notEmitterLayerProperty($0))
            }
        }

        self.addAnimationsGroup(animationDescriptor,
                                removeExistingAnimations: removeExistingAnimations,
                                animationDidFinish: animationDidFinish)
    }

    /// Adds an animation group to a CAEmitterLayer
    /// The animations will run concurrently
    /// throws if any of the descriptors describe animations on properties not applicabale to CAEmitterLayer
    ///
    /// - Parameters:
    ///   - animationDescriptors: Animation descriptors for CAEmitterLayer animations
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationDidFinish: invoked when the animation completes - any animationDidFinish actions on the individual descriptors will be ignored
    public func addConcurrentAnimations(describedBy animationDescriptors: [Descriptor.Root],
                                        removeExistingAnimations: Bool = false,
                                        animationDidFinish: AnimationDidFinishAction? = nil) throws {

        try animationDescriptors.forEach {
            try $0.propertyTypes.forEach {
                guard $0 is LayerProperty.Type || $0 is EmitterLayerProperty.Type else {
                    throw GroupAnimationCreationError.invalidDescriptor(.notEmitterLayerProperty($0))
                }
            }
        }

        let concurrentAnimationsDescriptor = Descriptor.Group.Concurrent(using: animationDescriptors)

        self.addConcurrentAnimations(concurrentAnimationsDescriptor,
                                     removeExistingAnimations: removeExistingAnimations,
                                     animationDidFinish: animationDidFinish)
    }

    /// Adds an animation group to a CAEmitterLayer
    /// The animations in the group will run in the order they're in in the array,
    /// and the animation's duration is the added durations of the animations created by the descriptors.
    /// throws if any of the descriptors describe animations on properties not applicabale to CAEmitterLayer
    ///
    /// - Parameters:
    ///   - animationDescriptors: Animation descriptors for CAEmitterLayer animations; these should have durations, which are used for timing the sequence
    ///   - removeExistingAnimations: removes any existing layer animations if true (continues down the sequence - each animation will remove other existing animations)
    ///   - animationDidFinish: invoked when the animation completes - any animationDidFinish actions on the individual descriptors will be ignored
    public func addAnimationSequence(describedBy animationDescriptors: [Descriptor.Root],
                                     removeExistingAnimations: Bool = false,
                                     animationDidFinish: AnimationDidFinishAction? = nil) throws {

        try animationDescriptors.forEach {
            try $0.propertyTypes.forEach {
                guard $0 is LayerProperty.Type || $0 is EmitterLayerProperty.Type else {
                    throw GroupAnimationCreationError.invalidDescriptor(.notEmitterLayerProperty($0))
                }
            }
        }

        self.addAnimationSequence(animationDescriptors,
                                  removeExistingAnimations: removeExistingAnimations,
                                  animationDidFinish: animationDidFinish)
    }
}
