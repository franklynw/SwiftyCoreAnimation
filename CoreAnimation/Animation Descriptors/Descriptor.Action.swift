//
//  Descriptor.Action.swift
//  SwiftyCoreAnimation
//
//  Created by Franklyn on 20/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Descriptor {

    /**
     A Descriptor for creating an inline action

     The use case for this is as part of an animation sequence, using Descriptor.Group.Sequence,
     as a descriptor in the array of descriptors used to construct the group.

     They will work outside of this, but there's not really any point as the action will be performed immediately

     ## Usage Example ##
     Create a Descriptor for a property-setting action, & add it to a sequence:
     ````
     let actionDescriptor = Descriptor.Action {
         // set the properties before we animate them
         myShapeLayer.set(FillColor(.blue))
         myShapeLayer.set(StrokeColor(.red))
     }

     let rotationDescriptor = Descriptor.Basic<Transform.Rotation.Z>.from(0, to: CGFloat.pi * 4)

     let currentFillColor = myShapeLayer.get(FillColor.self) ?? .clear
     let fillColorDescriptor = Descriptor.Basic<FillColor>.from(currentFillColor, to: .blue)
     let currentLineColor = myShapeLayer.get(StrokeColor.self) ?? .clear
     let strokeColorDescriptor = Descriptor.Basic<StrokeColor>.from(currentLineColor, to: .red)

     let colorsGroupDescriptor = Descriptor.Group.Concurrent(using: [fillColorDescriptor, strokeColorDescriptor], duration: 2)

     do {
         try myShapeLayer.addAnimationSequence(describedBy: [rotationDescriptor, actionDescriptor, colorsGroupDescriptor])
     } catch {
        // handle the error thrown if any of the animatable properties are not appropriate for the layer type (eg, fillColor on CAGradientLayer)
     }
     ````
    */
    public final class Action: Root {

        internal var action: () -> ()

        public init(action: @escaping () -> ()) {
            self.action = action
            super.init(duration: 0, animationProperties: [], propertyTypes: [])
        }
    }
}
