//
//  Descriptor.Action.swift
//  SwiftyCoreAnimation
//
//  Created by Franklyn on 20/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension Descriptor {

    // MARK: - Describes an Animation Action
    public final class Action: Root, AnimationDescribing {

        public typealias AnimationType = CABasicAnimation

        internal var action: () -> ()

        public init(action: @escaping () -> ()) {
            self.action = action
            super.init(duration: nil, animationProperties: [], propertyTypes: [], delegate: nil)
        }

        /// Creates & returns an instance of the animation described by the class instance
        override public var animation: AnimationType {

            let animation: CABasicAnimation = CABasicAnimation(keyPath: AnimationActions.animationKey)

            animation.fromValue = 0
            animation.toValue = 1

            return animation
        }
    }
}
