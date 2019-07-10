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
        internal private(set) var beginTime: TimeInterval = 0
        internal let animationProperties: [AnimationPropertiesApplicable]
        internal let propertyTypes: [BaseLayerProperty.Type]

        internal var overallDuration: TimeInterval {

            var animationDuration: TimeInterval = self.duration ?? 0.25

            if let mediaTimingProperties = self.animationProperties.filter({ $0 is Properties.MediaTiming }) as? [Properties.MediaTiming] {
                for property in mediaTimingProperties {
                    if case .repeatCount(let numberOfRepeats) = property {
                        animationDuration = TimeInterval(numberOfRepeats) * (self.duration ?? 0.25)
                        break
                    } else if case .repeatDuration(let duration) = property {
                        animationDuration = duration
                        break
                    }
                }
            }

            animationDuration += self.beginTime

            return animationDuration
        }

        /**
         A closure which is invoked immediately *before* the animation begins

         The closure is invoked as soon as the animation is added to the layer - the beginTime has no effect.
         For an action which is invoked when animation actually begins, use the animationDidBegin property,
         which is available on descriptors which implement AnimationDescribing
        */
        public var animationWillBegin: AnimationBeginAction?

        /// A closure which is invoked immediately *after* the animation finishes
        public var animationDidFinish: AnimationDidFinishAction?


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
                if let beginTime = $0 as? Properties.MediaTiming, case .beginTime(let time) = beginTime {
                    self.beginTime = time
                }
            }
        }
    }
}
