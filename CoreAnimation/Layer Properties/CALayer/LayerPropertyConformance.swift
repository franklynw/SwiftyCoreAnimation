//
//  CALayerPropertyConformances.swift
//  CoreAnimation
//
//  Created by Franklyn on 20/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


typealias LayerPropertyConformance = (KeyValueProviding & LayerProperty & ShapeLayerProperty & EmitterLayerProperty & GradientLayerProperty & ReplicatorLayerProperty & TextLayerProperty & Settable)
typealias AnimatableLayerPropertyConformance = LayerPropertyConformance & Animatable
typealias UnsettableLayerPropertyConformance = (KeyValueProviding & LayerProperty & ShapeLayerProperty & EmitterLayerProperty & GradientLayerProperty & ReplicatorLayerProperty & TextLayerProperty)
typealias UnsettableAnimatableLayerPropertyConformance = UnsettableLayerPropertyConformance & Animatable
