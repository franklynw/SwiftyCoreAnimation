//
//  DisabledImplictAnimations.swift
//  CoreAnimation
//
//  Created by Franklyn on 26/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


public protocol DisabledImplictAnimations {}


extension CALayer: DisabledImplictAnimations {}

public extension DisabledImplictAnimations where Self: CALayer {

    /// Constructs a DisabledAnimationProperties object for the CALayer
    ///
    /// - Parameter properties: the properties to ignore during the CATransaction
    /// - Returns: a DisabledAnimationProperties object
    func disabledImplicitAnimations(for properties: [LayerProperty.Type]) -> DisabledAnimationProperties {
        return DisabledAnimationProperties(layer: self, properties: properties)
    }
}

public extension DisabledImplictAnimations where Self: CAShapeLayer {

    /// Constructs a DisabledAnimationProperties object for the CAShapeLayer
    ///
    /// - Parameter properties: the properties to ignore during the CATransaction
    /// - Returns: a DisabledAnimationProperties object
    func disabledImplicitAnimations(for properties: [ShapeLayerProperty.Type]) -> DisabledAnimationProperties {
        return DisabledAnimationProperties(layer: self, properties: properties)
    }
}

public extension DisabledImplictAnimations where Self: CAEmitterLayer {

    /// Constructs a DisabledAnimationProperties object for the CAEmitterLayer
    ///
    /// - Parameter properties: the properties to ignore during the CATransaction
    /// - Returns: a DisabledAnimationProperties object
    func disabledImplicitAnimations(for properties: [EmitterLayerProperty.Type]) -> DisabledAnimationProperties {
        return DisabledAnimationProperties(layer: self, properties: properties)
    }
}

public extension DisabledImplictAnimations where Self: CAGradientLayer {

    /// Constructs a DisabledAnimationProperties object for the CAGradientLayer
    ///
    /// - Parameter properties: the properties to ignore during the CATransaction
    /// - Returns: a DisabledAnimationProperties object
    func disabledImplicitAnimations(for properties: [GradientLayerProperty.Type]) -> DisabledAnimationProperties {
        return DisabledAnimationProperties(layer: self, properties: properties)
    }
}

public extension DisabledImplictAnimations where Self: CAReplicatorLayer {

    /// Constructs a DisabledAnimationProperties object for the CAReplicatorLayer
    ///
    /// - Parameter properties: the properties to ignore during the CATransaction
    /// - Returns: a DisabledAnimationProperties object
    func disabledImplicitAnimations(for properties: [ReplicatorLayerProperty.Type]) -> DisabledAnimationProperties {
        return DisabledAnimationProperties(layer: self, properties: properties)
    }
}

public extension DisabledImplictAnimations where Self: CATextLayer {

    /// Constructs a DisabledAnimationProperties object for the CATextLayer
    ///
    /// - Parameter properties: the properties to ignore during the CATransaction
    /// - Returns: a DisabledAnimationProperties object
    func disabledImplicitAnimations(for properties: [TextLayerProperty.Type]) -> DisabledAnimationProperties {
        return DisabledAnimationProperties(layer: self, properties: properties)
    }
}
