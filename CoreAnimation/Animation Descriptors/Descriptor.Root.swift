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

        internal weak var animationDelegate: CAAnimationDelegate?
        internal let duration: TimeInterval?
        internal let animationProperties: [AnimationPropertiesApplicable]


        internal init(duration: TimeInterval?, animationProperties: [AnimationPropertiesApplicable], delegate: CAAnimationDelegate?) {
            self.animationDelegate = delegate
            self.duration = duration
            self.animationProperties = animationProperties
        }

        internal func setBaseProperties(for animation: CAAnimation) {

            if let duration = self.duration {
                animation.duration = duration
            }

            animation.delegate = self.animationDelegate

            self.animationProperties.forEach {
                ($0 as? InternalAnimationPropertiesApplying)?.applyProperty(to: animation)
            }
        }
    }
}
