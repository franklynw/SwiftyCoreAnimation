//
//  AnimatableEmitterLayerPropertyConformance.swift
//  CoreAnimation
//
//  Created by Franklyn on 26/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import Foundation


typealias EmitterLayerPropertyConformance = (EmitterLayerProperty & KeyValueProviding & Settable)
typealias AnimatableEmitterLayerPropertyConformance = EmitterLayerPropertyConformance & Animatable
