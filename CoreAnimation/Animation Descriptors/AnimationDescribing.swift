//
//  AnimationDescribing.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


protocol AnimationDescribing {
    associatedtype AnimationType: CAAnimation
    var animation: AnimationType { get }
}
