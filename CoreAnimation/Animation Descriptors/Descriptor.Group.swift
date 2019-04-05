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

    public class Group: Root {

        // The Concurrent & Sequence classes are embedded in the Group class so we can have a sort of name-spacing,
        // ie, Descriptor.Group.Concurrent or Descriptor.Group.Sequence

        /*
         The Group classes don't implement AnimationDescribing as they don't produce CAAnimationGroups (or any animation) directly
         Instead, the descriptor is used to add a group or sequence of other descriptors, including Action & Wait descriptors.
         Because of the way CAAnimationGroup works (any animation in the group can't have a CAAnimationDelegate), the structure is
         completely independent of CAAnimationGroup for sequences, and because the concurrent groups can have other groups inside them,
         it means we can't just return a CAAnimationGroup animation.
        */

        /**
         A Descriptor for creating a group of concurrent animations

         ## Usage Example ##
         Create a Descriptor for a group of concurrent animations, & add it to a layer:
         ````
         let keyFrameProperties: [Properties.KeyFrameAnimation] = [.calculationMode(.paced)]
         let moveDescriptor = Descriptor.KeyFrame<Position>.path(ellipsePath, otherAnimationProperties: keyFrameProperties)
         let rotateDescriptor = Descriptor.Basic<Transform.Rotation>.from(0, to: CGFloat.pi * 4)

         let groupDescriptor = Descriptor.Group.Concurrent(using: [moveDescriptor, rotateDescriptor], duration: 2)

         do {
            try myLayer.addAnimationsGroup(describedBy: groupDescriptor)
         } catch {
            // handle the error thrown if any of the animatable properties are not appropriate for the layer type (eg, fillColor on CAGradientLayer)
         }
         ````
        */
        public final class Concurrent: Group {

            internal let descriptors: [Descriptor.Root]

            /// Creates a descriptor for a Concurrent Animations Group
            /// The animations will run concurrently
            ///
            /// - Parameters:
            ///   - descriptors: Animation descriptors for CALayer animations; the group's duration is taken as being the longest duration + beginTime of any of the descriptors
            public init(using descriptors: [Descriptor.Root]) {

                self.descriptors = descriptors
                let propertyTypes: [BaseLayerProperty.Type] = self.descriptors.flatMap { $0.propertyTypes }

                super.init(duration: nil, animationProperties: [], propertyTypes: propertyTypes)
            }

            /// We take the duration of the longest animation (plus its beginTime) as being the group's duration
            public override var duration: TimeInterval? {
                get {
                    let duration = self.descriptors.reduce(into: TimeInterval(0)) {
                        $0 = (($1.duration ?? 0.25) + $1.beginTime) > $0 ? (($1.duration ?? 0.25) + $1.beginTime) : $0
                    }
                    return duration
                }
            }
        }

        /**
         A Descriptor for creating a sequence of animations

         ## Usage Example ##
         Create a Descriptor for a sequential group of animations, & add it to a layer:
         ````
         let fillColorDescriptor = Descriptor.Basic<FillColor>.from(.red, to: .blue)
         let waitDescriptor = Descriptor.Wait(for: 2)
         let lineWidthDescriptor = Descriptor.Basic<LineWidth>.from(currentLineWidth, to: 10, duration: 1)

         let groupDescriptor = Descriptor.Group.Sequential(using: [fillColorDescriptor, waitDescriptor, lineWidthDescriptor])

         do {
            try myShapeLayer.addAnimationsGroup(describedBy: groupDescriptor)
         } catch {
            // handle the error thrown if any of the animatable properties are not appropriate for the layer type (eg, fillColor on CAGradientLayer)
         }
         ````
        */
        public final class Sequential: Group {

            internal let descriptors: [Descriptor.Root]

            /// Creates a descriptor for a Sequential Animations Group
            /// The animations in the group will run in the order they're in in the array,
            /// and the animation's duration is the added durations of the animations created by the descriptors
            ///
            /// - Parameters:
            ///   - descriptors: Animation descriptors for CALayer animations; these should have durations, which are used for timing the sequence
            public init(using descriptors: [Descriptor.Root]) {

                self.descriptors = descriptors
                let propertyTypes: [BaseLayerProperty.Type] = self.descriptors.flatMap { $0.propertyTypes }

                super.init(duration: nil, animationProperties: [], propertyTypes: propertyTypes)
            }

            public override var duration: TimeInterval? {
                get {
                    let duration = self.descriptors.reduce(into: TimeInterval(0)) {
                        $0 += ($1.duration ?? 0.25) + $1.beginTime
                    }
                    return duration
                }
            }
        }
    }
}
