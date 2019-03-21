//
//  ActionLayer.swift
//  SwiftyCoreAnimation
//
//  Created by Franklyn on 20/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


extension CALayer {

    @discardableResult
    func addAction(duration: TimeInterval?, action: (() -> ())?) -> CABasicAnimation {
        return ActionLayer.addAction(to: self, duration: duration, action: action)
    }
}


/// Any action is invoked as soon as the animation begins - use AnimationFinishedActions for actions when the animation finishes
/// Not really sure of the use cases for this yet...
class ActionLayer: CALayer {

    static let animationKey: String = "animationProgress"

    private var action: (() -> ())?
    @NSManaged private(set) var animationProgress: CGFloat


    override init(layer: Any) {
        super.init(layer: layer)
    }

    init(layer: Any, action: (() -> ())?) {

        self.action = action

        super.init(layer: layer)

        self.frame = CGRect.zero
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override class func needsDisplay(forKey key: String) -> Bool {
        guard key == self.animationKey else {
            return super.needsDisplay(forKey: key)
        }
        return true
    }

    override func display() {
        super.display()

        self.action?()
        self.removeFromSuperlayer()
    }


    class func addAction(to layer: CALayer, duration: TimeInterval?, action: (() -> ())?) -> CABasicAnimation {

        let actionLayer: ActionLayer = ActionLayer(layer: layer, action: action)
        layer.insertSublayer(actionLayer, at: 0)

        let animation: CABasicAnimation = CABasicAnimation(keyPath: self.animationKey)
        animation.fromValue = 0
        animation.toValue = 1

        if let duration = duration {
            animation.duration = duration
        }

        actionLayer.add(animation, forKey: nil)

        return animation
    }
}
