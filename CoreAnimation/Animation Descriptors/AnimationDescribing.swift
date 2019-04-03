//
//  AnimationDescribing.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// This is used where we want to see if something conforms to AnimationDescribing,
/// as Swift doesn't (yet) support the use of protocols with associatedTypes as actual types
protocol TypeErasedAnimationDescribing {
    var typeErasedAnimation: CAAnimation { get }
}

protocol AnimationDescribing: TypeErasedAnimationDescribing {
    associatedtype AnimationType: CAAnimation // because we want specialized animation types such as CAKeyFrameAnimation, etc
    var animation: AnimationType { get }
}

extension AnimationDescribing {
    var typeErasedAnimation: CAAnimation { return self.animation }
}
