//
//  AnimationDescribing.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Group & Action descriptors don't implement this, as they don't explicitly provide an animation
protocol AnimationDescribing {
    /// The animation created by the implementor
    var animation: CAAnimation { get }

    /// The implementor adds an animationDidBegin action to the animation it creates, which is invoked immediately *after* the animation begins
    var animationDidBegin: AnimationBeginAction? { get set }
}
