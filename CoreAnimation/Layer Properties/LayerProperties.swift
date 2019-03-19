//
//  LayerProperties.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


public protocol Animatable {} // for properties which can be animated
public protocol Settable {} // for properties which are settable
public protocol BaseLayerProperty: KeyPathProviding {}


/// Implemented by SwiftyCoreAnimation properties which are used by CALayer animation descriptors
public protocol LayerProperty: BaseLayerProperty {}

/// Implemented by SwiftyCoreAnimation properties which are used by CAShapeLayer animation descriptors
public protocol ShapeLayerProperty: BaseLayerProperty {}

/// Implemented by SwiftyCoreAnimation properties which are used by CAEmitterLayer animation descriptors
public protocol EmitterLayerProperty: BaseLayerProperty {}

/// Implemented by SwiftyCoreAnimation properties which are used by CAGradientLayer animation descriptors
public protocol GradientLayerProperty: BaseLayerProperty {}

/// Implemented by SwiftyCoreAnimation properties which are used by CAReplicatorLayer animation descriptors
public protocol ReplicatorLayerProperty: BaseLayerProperty {}

/// Implemented by SwiftyCoreAnimation properties which are used by CATextLayer animation descriptors
public protocol TextLayerProperty: BaseLayerProperty {}
