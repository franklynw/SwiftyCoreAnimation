//
//  AnimationActions.swift
//  CoreAnimation
//
//  Created by Franklyn on 25/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


public typealias AnimationDidFinishAction = (CAAnimation?, Bool) -> ()
public typealias AnimationBeginAction = () -> ()


public extension CAAnimation {

    /// Adds an AnimationBeginAction to the animation
    /// If the animation delegate has already been set, this remains unchanged,
    /// however if the animation delegate is subsequently changed, the finished action will not be called
    ///
    /// - Parameter action: action invoked when animation finishes
    /// - Returns: the action identifier
    @discardableResult
    public func addAnimationDidBeginAction(_ action: @escaping AnimationBeginAction) -> Int {
        return AnimationActions.addBeginAction(action, to: self, realDelegate: self.delegate)
    }

    /// Adds an AnimationDidFinishAction action to the animation
    /// If the animation delegate has already been set, this remains unchanged,
    /// however if the animation delegate is subsequently changed, the finished action will not be called
    ///
    /// - Parameter action: action invoked when animation finishes
    /// - Returns: the action identifier
    @discardableResult
    public func addAnimationDidFinishAction(_ action: @escaping AnimationDidFinishAction) -> Int {
        return AnimationActions.addFinishAction(action, to: self, realDelegate: self.delegate)
    }

    /// Removes the specified action from the animation
    ///
    /// - Parameter id: the action's id as returned when it was originally set
    public func removeAnimationAction(withID id: Int) {
        AnimationActions.removeAction(withID: id, for: self)
    }

    /// Removes all AnimationDidBeginActions from the animation
    public func removeAllAnimationDidBeginActions() {
        AnimationActions.removeBeginActions(for: self)
    }

    /// Removes all AnimationDidFinishActions from the animation
    public func removeAllAnimationDidFinishActions() {
        AnimationActions.removeFinishActions(for: self)
    }

    /// Removes all actions from the animation
    public func removeAllActions() {
        AnimationActions.removeAllActions(for: self)
    }
}


fileprivate class AnimationActions {

    private typealias ActionWithID = (id: Int, animatonDelegate: AnimationDelegate)

    private static let animationDelegates: NSMapTable<CAAnimation, AnimationDelegate> = NSMapTable<CAAnimation, AnimationDelegate>(keyOptions: .weakMemory, valueOptions: .weakMemory)
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
        var beginActions: [Int: AnimationBeginAction] = [:]
        var finishActions: [Int: AnimationDidFinishAction] = [:]

        class func setup(realDelegate: CAAnimationDelegate?, beginAction action: @escaping AnimationBeginAction) -> ActionWithID {
            let animationDelegate = AnimationDelegate(realDelegate: realDelegate)
            let animationID: Int = animationDelegate.addBeginAction(action)
            return (animationID, animationDelegate)
        }

        class func setup(realDelegate: CAAnimationDelegate?, finishAction action: @escaping AnimationDidFinishAction) -> ActionWithID {
            let animationDelegate = AnimationDelegate(realDelegate: realDelegate)
            let animationID: Int = animationDelegate.addFinishAction(action)
            return (animationID, animationDelegate)
        }

        init(realDelegate: CAAnimationDelegate?) {
            super.init()
            self.realDelegate = realDelegate
        }

        func addBeginAction(_ action: @escaping AnimationBeginAction) -> Int {
            let animationID: Int = AnimationActions.animationID
            self.beginActions[animationID] = action
            return animationID
        }

        func addFinishAction(_ action: @escaping AnimationDidFinishAction) -> Int {
            let animationID: Int = AnimationActions.animationID
            self.finishActions[animationID] = action
            return animationID
        }

        func removeAction(withID id: Int) {
            self.beginActions.removeValue(forKey: id)
            self.finishActions.removeValue(forKey: id)
        }

        func removeAllBeginActions() {
            self.beginActions.removeAll()
        }

        func removeAllFinishActions() {
            self.finishActions.removeAll()
        }

        func animationDidStart(_ anim: CAAnimation) {
            self.realDelegate?.animationDidStart?(anim)
            self.beginActions.forEach {
                $0.value()
            }
            AnimationActions.removeBeginActions(for: anim)
        }

        func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
            self.realDelegate?.animationDidStop?(anim, finished: flag)
            self.finishActions.forEach {
                $0.value(anim, flag)
            }
            AnimationActions.removeFinishActions(for: anim)
        }
    }

    class func addBeginAction(_ action: @escaping AnimationBeginAction, to animation: CAAnimation, realDelegate: CAAnimationDelegate?) -> Int {

        if let animationDelegate: AnimationDelegate = self.animationDelegates.object(forKey: animation) {
            return animationDelegate.addBeginAction(action)
        } else {
            let actionAndID: ActionWithID = AnimationDelegate.setup(realDelegate: realDelegate, beginAction: action)
            let animationDelegate: AnimationDelegate = actionAndID.animatonDelegate
            animation.delegate = animationDelegate
            self.animationDelegates.setObject(animationDelegate, forKey: animation)
            return actionAndID.id
        }
    }

    class func addFinishAction(_ action: @escaping AnimationDidFinishAction, to animation: CAAnimation, realDelegate: CAAnimationDelegate?) -> Int {

        if let animationDelegate: AnimationDelegate = self.animationDelegates.object(forKey: animation) {
            return animationDelegate.addFinishAction(action)
        } else {
            let actionAndID: ActionWithID = AnimationDelegate.setup(realDelegate: realDelegate, finishAction: action)
            let animationDelegate: AnimationDelegate = actionAndID.animatonDelegate
            animation.delegate = animationDelegate
            self.animationDelegates.setObject(animationDelegate, forKey: animation)
            return actionAndID.id
        }
    }

    class func removeAction(withID id: Int, for animation: CAAnimation) {
        if let animationDelegate: AnimationDelegate = self.animationDelegates.object(forKey: animation) {
            if animationDelegate.beginActions[id] != nil, animationDelegate.beginActions.count == 1 {
                self.removeBeginActions(for: animation)
            } else if animationDelegate.finishActions[id] != nil, animationDelegate.finishActions.count == 1 {
                self.removeFinishActions(for: animation)
            } else {
                animationDelegate.removeAction(withID: id)
            }
        }
    }

    class func removeBeginActions(for animation: CAAnimation) {
        let animationDelegate: AnimationDelegate? = self.animationDelegates.object(forKey: animation)
        if let realDelegate: CAAnimationDelegate = animationDelegate?.realDelegate {
            animation.delegate = realDelegate
        }
        animationDelegate?.removeAllBeginActions()
        if animationDelegate?.finishActions.isEmpty == true {
            self.animationDelegates.removeObject(forKey: animation)
        }
    }

    class func removeFinishActions(for animation: CAAnimation) {
        let animationDelegate: AnimationDelegate? = self.animationDelegates.object(forKey: animation)
        if let realDelegate: CAAnimationDelegate = animationDelegate?.realDelegate {
            animation.delegate = realDelegate
        }
        animationDelegate?.removeAllFinishActions()
        if animationDelegate?.beginActions.isEmpty == true {
            self.animationDelegates.removeObject(forKey: animation)
        }
    }

    class func removeAllActions(for animation: CAAnimation) {
        self.removeBeginActions(for: animation)
        self.removeFinishActions(for: animation)
    }
}
