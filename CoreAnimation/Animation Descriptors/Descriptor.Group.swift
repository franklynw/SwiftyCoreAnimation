//
//  Descriptor.Group.swift
//  SwiftyCoreAnimation
//
//  Created by Franklyn on 14/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Because there's no way to enforce the animation property types in a group on a particular kind of CALayer,
/// we have to do a run-time check to make sure that they're all ok.
/// If they're not, we throw a .invalidDescriptor error with an associated InvalidReason (eg, CAShapeLayer property on a CAGradientLayer)
public enum GroupAnimationCreationError: LocalizedError {
    case invalidDescriptor(InvalidReason)

    public var errorDescription: String? {
        switch self {
        case .invalidDescriptor(let invalidReason):
            return "Invalid descriptor: " + (invalidReason.localizedDescription ?? "unknown reason")
        }
    }

    public enum InvalidReason {
        case notLayerProperty(BaseLayerProperty.Type)
        case notShapeLayerProperty(BaseLayerProperty.Type)
        case notEmitterLayerProperty(BaseLayerProperty.Type)
        case notGradientLayerProperty(BaseLayerProperty.Type)
        case notReplicatorLayerProperty(BaseLayerProperty.Type)
        case notTextLayerProperty(BaseLayerProperty.Type)

        public var localizedDescription: String? {
            switch self {
            case .notLayerProperty(let property):
                return "'\(property)' is not a layer property"
            case .notShapeLayerProperty(let property):
                return "'\(property)' is not a shape layer property"
            case .notEmitterLayerProperty(let property):
                return "'\(property)' is not an emitter layer property"
            case .notGradientLayerProperty(let property):
                return "'\(property)' is not a gradient layer property"
            case .notReplicatorLayerProperty(let property):
                return "'\(property)' is not a replicator layer property"
            case .notTextLayerProperty(let property):
                return "'\(property)' is not a text layer property"
            }
        }
    }
}


extension Descriptor {

    // MARK: - Describes an Animation Group
    public final class Group: Root {

        public typealias AnimationType = CAAnimationGroup

        internal let descriptors: [Descriptor.Root]
        internal let isConcurrent: Bool

        fileprivate init(_ descriptors: [Descriptor.Root],
                         duration: TimeInterval?,
                         animationProperties: [PropertiesApplicableToAnimationGroups],
                         isConcurrent: Bool,
                         delegate: CAAnimationDelegate?) {

            self.descriptors = descriptors
            self.isConcurrent = isConcurrent
            let propertyTypes: [BaseLayerProperty.Type] = self.descriptors.flatMap { $0.propertyTypes }

            super.init(duration: duration, animationProperties: animationProperties, propertyTypes: propertyTypes, delegate: delegate)
        }

        public override var duration: TimeInterval? {
            get {
                if self.isConcurrent {
                    return super.duration
                } else {
                    let duration = self.descriptors.reduce(into: TimeInterval(0)) {
                        $0 += ($1.duration ?? 0.25)
                    }
                    return duration
                }
            }
        }
    }
}


extension Descriptor.Group {

    /// Creates a descriptor for an Animation Group
    /// The animations will run concurrently
    ///
    /// - Parameters:
    ///   - descriptors: Animation descriptors for CAShapeLayer animations
    ///   - duration: the animation duration - if the descriptors specify a longer duration than this, the animation duration will be clipped, not scaled
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToAnimationGroups
    ///   - delegate: the animation's delegate
    /// - Returns: a Group Descriptor object
    public static func concurrent(using descriptors: [Descriptor.Root],
                                  duration: TimeInterval? = nil,
                                  otherAnimationProperties: [PropertiesApplicableToAnimationGroups] = [],
                                  delegate: CAAnimationDelegate? = nil) -> Self {

        return self.init(descriptors,
                         duration: duration,
                         animationProperties: otherAnimationProperties,
                         isConcurrent: true,
                         delegate: delegate)
    }

    /// Creates a descriptor for an Animation Group
    /// The animations in the group will run in the order they're in in the array,
    /// and the animation's duration is the added durations of the animations created by the descriptors
    ///
    /// - Parameters:
    ///   - descriptors: Animation descriptors for CAShapeLayer animations; these should have durations, which are used for timing the sequence
    ///   - otherAnimationProperties: animation properties which conform to PropertiesApplicableToAnimationGroups
    ///   - delegate: the animation's delegate
    /// - Returns: a Group Descriptor object
    public static func sequential(using descriptors: [Descriptor.Root],
                                  otherAnimationProperties: [PropertiesApplicableToAnimationGroups] = [],
                                  delegate: CAAnimationDelegate? = nil) -> Self {

        return self.init(descriptors,
                         duration: nil,
                         animationProperties: otherAnimationProperties,
                         isConcurrent: false,
                         delegate: delegate)
    }
}
