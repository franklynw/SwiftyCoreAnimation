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

    /// Adds a CABasicAnimation to a CALayer
    ///
    /// - Parameters:
    ///   - animationDescriptor: Descriptor.Basic<T> animation descriptor, where T conforms to ReplicatorLayerProperty
    ///   - key: key for the animation
    ///   - properties: an array of Descriptor.Properties applicable to CAPropertyAnimations; if the Descriptor already has animation properties,
    ///             these will be over-ridden by the values passed in here
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationFinished: invoked when the animation completes
    /// - Returns: the animation object
    @discardableResult
    public func addBasicAnimation<T: ReplicatorLayerProperty & Animatable>(describedBy animationDescriptor: Descriptor.Basic<T>,
                                                                           forKey key: String? = nil,
                                                                           applyingOtherProperties properties: [PropertiesApplicableToBasicAnimations] = [],
                                                                           removeExistingAnimations: Bool = false,
                                                                           animationFinished: AnimationFinishedAction? = nil) -> CABasicAnimation {

        return self.addBasicAnimation(animationDescriptor,
                                      forKey: key,
                                      applyingProperties: properties,
                                      removeExistingAnimations: removeExistingAnimations,
                                      animationFinished: animationFinished)
    }

    /// Adds a CAKeyFrameAnimation to a CALayer
    ///
    /// - Parameters:
    ///   - animationDescriptor: Descriptor.KeyFrame<T> animation descriptor, where T conforms to ReplicatorLayerProperty
    ///   - key: key for the animation
    ///   - properties: an array of Descriptor.Properties applicable to CAKeyFrameAnimations; if the Descriptor already has animation properties,
    ///             these will be over-ridden by the values passed in here
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationFinished: invoked when the animation completes
    /// - Returns: the animation object
    @discardableResult
    public func addKeyFrameAnimation<T: ReplicatorLayerProperty & Animatable>(describedBy animationDescriptor: Descriptor.KeyFrame<T>,
                                                                              forKey key: String? = nil,
                                                                              applyingOtherProperties properties: [PropertiesApplicableToKeyFrameAnimations] = [],
                                                                              removeExistingAnimations: Bool = false,
                                                                              animationFinished: AnimationFinishedAction? = nil) -> CAKeyframeAnimation {

        return self.addKeyFrameAnimation(animationDescriptor,
                                         forKey: key,
                                         applyingProperties: properties,
                                         removeExistingAnimations: removeExistingAnimations,
                                         animationFinished: animationFinished)
    }

    /// Adds a CASpringAnimation to a CALayer
    ///
    /// - Parameters:
    ///   - animationDescriptor: Descriptor.Spring<T> animation descriptor, where T conforms to ReplicatorLayerProperty
    ///   - key: key for the animation
    ///   - properties: an array of Descriptor.Properties applicable to CASpringAnimations; if the Descriptor already has animation properties,
    ///             these will be over-ridden by the values passed in here
    ///   - removeExistingAnimations: removes any existing layer animations if true
    ///   - animationFinished: invoked when the animation completes
    /// - Returns: the animation object
    @discardableResult
    public func addSpringAnimation<T: ReplicatorLayerProperty & Animatable>(describedBy animationDescriptor: Descriptor.Spring<T>,
                                                                            forKey key: String? = nil,
                                                                            applyingOtherProperties properties: [PropertiesApplicableToSpringAnimations] = [],
                                                                            removeExistingAnimations: Bool = false,
                                                                            animationFinished: AnimationFinishedAction? = nil) -> CASpringAnimation {
        
        return self.addSpringAnimation(animationDescriptor,
                                       forKey: key,
                                       applyingProperties: properties,
                                       removeExistingAnimations: removeExistingAnimations,
                                       animationFinished: animationFinished)
    }
}
