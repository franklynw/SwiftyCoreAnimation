//
//  ShapeLayerPropertyConformance.swift
//  CoreAnimation
//
//  Created by Franklyn on 26/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


typealias ShapeLayerPropertyConformance = (ShapeLayerProperty & KeyValueProviding & Settable)
typealias AnimatableShapeLayerPropertyConformance = ShapeLayerPropertyConformance & Animatable
