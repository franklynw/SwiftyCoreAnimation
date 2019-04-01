//
//  Descriptor.Wait.swift
//  SwiftyCoreAnimation
//
//  Created by Franklyn on 21/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Descriptor {

    // MARK: - Describes an Animation Action
    public final class Wait: Root, AnimationDescribing {

        public typealias AnimationType = CABasicAnimation

        private static let animationKey = "wait"


        public init(for duration: TimeInterval) {
            super.init(duration: duration, animationProperties: [], propertyTypes: [])
        }

        override internal var animation: AnimationType {

            let animation: CABasicAnimation = CABasicAnimation(keyPath: Wait.animationKey)
            animation.fromValue = 0
            animation.toValue = 1

            if let duration = self.duration {
                animation.duration = duration
            }

            return animation
        }
    }
}
