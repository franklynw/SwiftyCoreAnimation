//
//  LayerProperties.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation

/// For properties which can be animated
public protocol Animatable {}

/// For properties which are settable (ie, not read-only)
public protocol Settable {}

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
