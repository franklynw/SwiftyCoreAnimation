//
//  AnimationActions.swift
//  SwiftyCoreAnimation
//
//  Created by Franklyn on 20/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


//public extension CALayer {
//
//    public func addAction(_ action: @escaping () -> ()) {
//        AnimationActions.addAction(to: self, action: action)
//    }
//}


class AnimationActions {

    static let animationKey: String = "animationProgress"
    static let animationActionKey: String = "animationAction"

    class ActionLayer: CALayer {

        private var action: (() -> ())?
        @NSManaged private(set) var animationProgress: CGFloat


        override init(layer: Any) {
            super.init(layer: layer)
        }

        init(layer: Any, action: @escaping () -> ()) {

            self.action = action

            super.init(layer: layer)

            self.frame = CGRect.zero
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override class func needsDisplay(forKey key: String) -> Bool {
            guard key == AnimationActions.animationKey else {
                return super.needsDisplay(forKey: key)
            }
            return true
        }

        override func display() {
            super.display()

            self.action?()
            self.removeFromSuperlayer()
        }
    }


    class func addActionAnimation(_ animation: CABasicAnimation, to layer: CALayer, beginTime: TimeInterval, action: @escaping () -> ()) {

        let actionLayer: ActionLayer = ActionLayer(layer: layer, action: action)
        layer.insertSublayer(actionLayer, at: 0)

//        let animation: CABasicAnimation = CABasicAnimation(keyPath: AnimationActions.animationKey)
//        animation.fromValue = 0
//        animation.toValue = 1
        animation.beginTime = CACurrentMediaTime() + beginTime
        animation.setValue(action, forKey: AnimationActions.animationActionKey)

        actionLayer.add(animation, forKey: nil)
    }
}
