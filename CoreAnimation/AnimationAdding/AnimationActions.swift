//
//  AnimationActions.swift
//  SwiftyCoreAnimation
//
//  Created by Franklyn on 20/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


public extension CALayer {

    public func addAction(_ action: @escaping () -> ()) {
        AnimationActions.addAction(to: self, action: action)
    }
}


public class AnimationActions {

    class ActionLayer: CALayer {

        private static let animationKey: String = "animationProgress"

        private var action: (() -> ())?
        @NSManaged private(set) var animationProgress: CGFloat


        override init(layer: Any) {
            super.init(layer: layer)
        }

        init(layer: Any, action: @escaping () -> ()) {

            self.action = action

            super.init(layer: layer)

            self.frame = CGRect.zero

            let animation: CABasicAnimation = CABasicAnimation(keyPath: ActionLayer.animationKey)
            animation.fromValue = 0
            animation.toValue = 1
            animation.beginTime = CACurrentMediaTime()

            self.add(animation, forKey: nil)
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override class func needsDisplay(forKey key: String) -> Bool {
            guard key == ActionLayer.animationKey else {
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


    class func addAction(to layer: CALayer, action: @escaping () -> ()) {
        let actionLayer: ActionLayer = ActionLayer(layer: layer, action: action)
        layer.insertSublayer(actionLayer, at: 0)
    }
}
