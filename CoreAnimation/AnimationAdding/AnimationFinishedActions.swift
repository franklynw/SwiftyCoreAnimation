//
//  AnimationFinishedActions.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


public typealias AnimationFinishedAction = (CAAnimation, Bool) -> ()


public extension CAAnimation {

    /// Adds an animation finished action to the animation
    /// If the animation delegate has already been set, this remains unchanged,
    /// however if the animation delegate is subsequently changed, the finished action will not be called
    ///
    /// - Parameter action: action invoked when animation finishes
    /// - Returns: the action identifier
    @discardableResult
    public func addAnimationFinishedAction(_ action: @escaping AnimationFinishedAction) -> Int {
        return AnimationFinishedActions.addAction(action, to: self, realDelegate: self.delegate)
    }

    /// Removes the specified animationFinishedAction from the animation
    ///
    /// - Parameter id: the animationFinishedAction's id as returned when it was originally set
    public func removeAnimationFinishedAction(withID id: Int) {
        AnimationFinishedActions.removeAction(withID: id, for: self)
    }

    /// Removes all animationFinishedActions from the animation
    public func removeAllAnimationFinishedActions() {
        AnimationFinishedActions.removeActions(for: self)
    }
}


fileprivate class AnimationFinishedActions {

    private typealias ActionWithID = (id: Int, animatonDelegate: AnimationDelegate)

    private static let animationDelegates: NSMapTable<CAAnimation, AnimationDelegate> = NSMapTable<CAAnimation, AnimationDelegate>(keyOptions: .weakMemory, valueOptions: .strongMemory)
    private static var _animationID: Int = 0
    private static var animationID: Int {
        get {
            defer {
                self._animationID += 1
            }
            return self._animationID
        }
    }


    /// Private class whose instances act as the animation delegate
    private class AnimationDelegate: NSObject, CAAnimationDelegate {

        weak var realDelegate: CAAnimationDelegate?
        var actions: [Int: AnimationFinishedAction] = [:]

        class func setup(realDelegate: CAAnimationDelegate?, action: @escaping AnimationFinishedAction) -> ActionWithID {
            let animationDelegate = AnimationDelegate(realDelegate: realDelegate, action: action)
            let animationID: Int = animationDelegate.addAction(action)
            return (animationID, animationDelegate)
        }

        init(realDelegate: CAAnimationDelegate?, action: @escaping AnimationFinishedAction) {
            super.init()
            self.realDelegate = realDelegate
        }

        func addAction(_ action: @escaping AnimationFinishedAction) -> Int {
            let animationID: Int = AnimationFinishedActions.animationID
            self.actions[animationID] = action
            return animationID
        }

        func removeAction(withID id: Int) {
            self.actions.removeValue(forKey: id)
        }

        func removeAllActions() {
            self.actions.removeAll()
        }

        func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
            self.realDelegate?.animationDidStop?(anim, finished: flag)
            self.actions.forEach {
                $0.value(anim, flag)
            }
            AnimationFinishedActions.removeActions(for: anim)
        }
    }

    class func addAction(_ action: @escaping AnimationFinishedAction, to animation: CAAnimation, realDelegate: CAAnimationDelegate?) -> Int {

        if let animationDelegate: AnimationDelegate = self.animationDelegates.object(forKey: animation) {
            return animationDelegate.addAction(action)
        } else {
            let actionAndID: ActionWithID = AnimationDelegate.setup(realDelegate: realDelegate, action: action)
            let animationDelegate: AnimationDelegate = actionAndID.animatonDelegate
            animation.delegate = animationDelegate
            self.animationDelegates.setObject(animationDelegate, forKey: animation)
            return actionAndID.id
        }
    }

    class func removeAction(withID id: Int, for animation: CAAnimation) {
        if let animationDelegate: AnimationDelegate = self.animationDelegates.object(forKey: animation) {
            if animationDelegate.actions.count == 1 {
                self.removeActions(for: animation)
            } else {
                animationDelegate.removeAction(withID: id)
            }
        }
    }

    class func removeActions(for animation: CAAnimation) {
        let animationDelegate: AnimationDelegate? = self.animationDelegates.object(forKey: animation)
        if let realDelegate: CAAnimationDelegate = animationDelegate?.realDelegate {
            animation.delegate = realDelegate
        }
        animationDelegate?.removeAllActions()
        self.animationDelegates.removeObject(forKey: animation)
    }
}
