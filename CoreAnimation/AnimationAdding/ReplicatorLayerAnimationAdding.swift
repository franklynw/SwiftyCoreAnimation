//
//  ReplicatorLayerAnimationAdding.swift
//  CoreAnimation
//
//  Created by Franklyn on 21/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


public protocol ReplicatorLayerAnimationAdding {}

extension CAReplicatorLayer: ReplicatorLayerAnimationAdding {}
public extension ReplicatorLayerAnimationAdding where Self: CAReplicatorLayer {

    /// Set the layer's property using the 'nice' type
    ///
    /// - Parameter property: object conforming to ReplicatorLayerProperty & KeyValueProviding & KeyPathProviding & Settable
    public func set<T: ReplicatorLayerProperty & KeyValueProviding & KeyPathProviding & Settable>(_ property: T) {
        self.setValue(property.value?.keyValue, forKeyPath: T.keyPath)
    }

    /// Get the layer's value for the specified property
    ///
    /// - Parameter propertyType: conforming to ReplicatorLayerProperty & KeyValueProviding & KeyPathProviding
    /// - Returns: property as KeyValueType
    public func get<T: ReplicatorLayerProperty & KeyValueProviding & KeyPathProviding>(_ propertyType: T.Type) -> T.KeyValueType? {
        let value: Any? = self.value(forKeyPath: T.keyPath)
        return T.toKeyValueType(value)
    }

    /// Adds a CABasicAnimation to a CAReplicatorLayer
    ///
    /// - Parameters:
    ///   - animationDescriptor: Descriptor.Basic<T> animation descriptor, where T conforms to ReplicatorLayerProperty
    ///   - key: key for the animation
    ///   - properties: an array of Descriptor.Properties applicable to CAPropertyAnimations; if the Descriptor already has animation properties,
    ///             these will be over-ridden by the values passed in here
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationFinished: invoked when the animation completes
    public func addBasicAnimation<T: ReplicatorLayerProperty & Animatable>(describedBy animationDescriptor: Descriptor.Basic<T>,
                                                                           forKey key: String? = nil,
                                                                           applyingOtherProperties properties: [PropertiesApplicableToBasicAnimations] = [],
                                                                           removeExistingAnimations: Bool = false,
                                                                           animationFinished: AnimationFinishedAction? = nil) {

        self.addBasicAnimation(animationDescriptor,
                               forKey: key,
                               applyingProperties: properties,
                               removeExistingAnimations: removeExistingAnimations,
                               animationFinished: animationFinished)
    }

    /// Adds a CAKeyFrameAnimation to a CAReplicatorLayer
    ///
    /// - Parameters:
    ///   - animationDescriptor: Descriptor.KeyFrame<T> animation descriptor, where T conforms to ReplicatorLayerProperty
    ///   - key: key for the animation
    ///   - properties: an array of Descriptor.Properties applicable to CAKeyFrameAnimations; if the Descriptor already has animation properties,
    ///             these will be over-ridden by the values passed in here
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationFinished: invoked when the animation completes
    public func addKeyFrameAnimation<T: ReplicatorLayerProperty & Animatable>(describedBy animationDescriptor: Descriptor.KeyFrame<T>,
                                                                              forKey key: String? = nil,
                                                                              applyingOtherProperties properties: [PropertiesApplicableToKeyFrameAnimations] = [],
                                                                              removeExistingAnimations: Bool = false,
                                                                              animationFinished: AnimationFinishedAction? = nil) {

        self.addKeyFrameAnimation(animationDescriptor,
                                  forKey: key,
                                  applyingProperties: properties,
                                  removeExistingAnimations: removeExistingAnimations,
                                  animationFinished: animationFinished)
    }

    /// Adds a CASpringAnimation to a CAReplicatorLayer
    ///
    /// - Parameters:
    ///   - animationDescriptor: Descriptor.Spring<T> animation descriptor, where T conforms to ReplicatorLayerProperty
    ///   - key: key for the animation
    ///   - properties: an array of Descriptor.Properties applicable to CASpringAnimations; if the Descriptor already has animation properties,
    ///             these will be over-ridden by the values passed in here
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationFinished: invoked when the animation completes
    public func addSpringAnimation<T: ReplicatorLayerProperty & Animatable>(describedBy animationDescriptor: Descriptor.Spring<T>,
                                                                            forKey key: String? = nil,
                                                                            applyingOtherProperties properties: [PropertiesApplicableToSpringAnimations] = [],
                                                                            removeExistingAnimations: Bool = false,
                                                                            animationFinished: AnimationFinishedAction? = nil) {
        
        self.addSpringAnimation(animationDescriptor,
                                forKey: key,
                                applyingProperties: properties,
                                removeExistingAnimations: removeExistingAnimations,
                                animationFinished: animationFinished)
    }

    /// Adds an animation group to a CAReplicatorLayer
    /// The animations will run concurrently
    /// throws if any of the descriptors describe animations on properties not applicabale to CAReplicatorLayer
    ///
    /// - Parameters:
    ///   - animationDescriptor: a Group Animation descriptor - whether it is concurrent or sequential is determined by the descriptor
    ///   - key: key for the animation
    ///   - properties: an array of Descriptor.Properties applicable to CAAnimationGroups; if the Descriptor already has animation properties,
    ///             these will be over-ridden by the values passed in here
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationFinished: invoked when the animation completes - any animationFinished actions on the individual descriptors will be ignored
    public func addAnimationsGroup(describedBy animationDescriptor: Descriptor.Group,
                                   forKey key: String? = nil,
                                   applyingOtherProperties properties: [PropertiesApplicableToAnimationGroups] = [],
                                   removeExistingAnimations: Bool = false,
                                   animationFinished: AnimationFinishedAction? = nil) throws {

        try animationDescriptor.propertyTypes.forEach {
            guard $0 is LayerProperty.Type || $0 is ReplicatorLayerProperty.Type else {
                throw GroupAnimationCreationError.invalidDescriptor(.notReplicatorLayerProperty($0))
            }
        }

        self.addAnimationsGroup(animationDescriptor,
                                forKey: key,
                                applyingProperties: properties,
                                removeExistingAnimations: removeExistingAnimations,
                                animationFinished: animationFinished)
    }

    /// Adds an animation group to a CAReplicatorLayer
    /// The animations will run concurrently
    /// throws if any of the descriptors describe animations on properties not applicabale to CAReplicatorLayer
    ///
    /// - Parameters:
    ///   - animationDescriptors: Animation descriptors for CAReplicatorLayer animations
    ///   - key: key for the animation
    ///   - duration: the animation duration - if the descriptors specify a longer duration than this, the animation duration will be clipped, not scaled
    ///   - properties: an array of Descriptor.Properties applicable to CAAnimationGroups; if the Descriptor already has animation properties,
    ///             these will be over-ridden by the values passed in here
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationFinished: invoked when the animation completes - any animationFinished actions on the individual descriptors will be ignored
    public func addConcurrentAnimationsGroup(describedBy animationDescriptors: [Descriptor.Root],
                                             forKey key: String? = nil,
                                             duration: TimeInterval,
                                             applyingOtherProperties properties: [PropertiesApplicableToAnimationGroups] = [],
                                             removeExistingAnimations: Bool = false,
                                             animationFinished: AnimationFinishedAction? = nil) throws {

        try animationDescriptors.forEach {
            try $0.propertyTypes.forEach {
                guard $0 is LayerProperty.Type || $0 is ReplicatorLayerProperty.Type else {
                    throw GroupAnimationCreationError.invalidDescriptor(.notReplicatorLayerProperty($0))
                }
            }
        }

        self.addConcurrentAnimationsGroup(animationDescriptors,
                                          forKey: key,
                                          duration: duration,
                                          applyingProperties: properties,
                                          removeExistingAnimations: removeExistingAnimations,
                                          animationFinished: animationFinished)
    }

    /// Adds an animation group to a CAReplicatorLayer
    /// The animations in the group will run in the order they're in in the array,
    /// and the animation's duration is the added durations of the animations created by the descriptors.
    /// throws if any of the descriptors describe animations on properties not applicabale to CAReplicatorLayer
    ///
    /// - Parameters:
    ///   - animationDescriptors: Animation descriptors for CAReplicatorLayer animations; these should have durations, which are used for timing the sequence
    ///   - key: key for the animation
    ///   - properties: an array of Descriptor.Properties applicable to CAAnimationGroups; if the Descriptor already has animation properties,
    ///             these will be over-ridden by the values passed in here
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationFinished: invoked when the animation completes - any animationFinished actions on the individual descriptors will be ignored
    public func addAnimationSequence(describedBy animationDescriptors: [Descriptor.Root],
                                     forKey key: String? = nil,
                                     applyingOtherProperties properties: [PropertiesApplicableToAnimationGroups] = [],
                                     removeExistingAnimations: Bool = false,
                                     animationFinished: AnimationFinishedAction? = nil) throws {

        try animationDescriptors.forEach {
            try $0.propertyTypes.forEach {
                guard $0 is LayerProperty.Type || $0 is ReplicatorLayerProperty.Type else {
                    throw GroupAnimationCreationError.invalidDescriptor(.notReplicatorLayerProperty($0))
                }
            }
        }
        
        self.addAnimationSequence(animationDescriptors,
                                  forKey: key,
                                  applyingProperties: properties,
                                  removeExistingAnimations: removeExistingAnimations,
                                  animationFinished: animationFinished)
    }
}
