//
//  Descriptor.Root.swift
//  CoreAnimation
//
//  Created by Franklyn on 22/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Descriptor {

    public class Root {

        internal private(set) var duration: TimeInterval?
        internal let animationProperties: [AnimationPropertiesApplicable]
        internal let propertyTypes: [BaseLayerProperty.Type]


        internal init(duration: TimeInterval?, animationProperties: [AnimationPropertiesApplicable], propertyTypes: [BaseLayerProperty.Type]) {
            self.duration = duration
            self.animationProperties = animationProperties
            self.propertyTypes = propertyTypes
        }

        internal func setBaseProperties(for animation: CAAnimation) {

            if let duration = self.duration {
                animation.duration = duration
            }

            self.animationProperties.forEach {
                ($0 as? InternalAnimationPropertiesApplying)?.applyProperty(to: animation)
            }
        }

        internal var animation: CAAnimation {
            fatalError("Must override")
        }
    }
}
