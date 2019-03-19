//
//  RenderMode.swift
//  CoreAnimation
//
//  Created by Franklyn on 08/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit


/// Wrapper for the emitterLayer's renderMode property
public struct RenderMode: EmitterLayerPropertyConformance {
    public typealias KeyValueType = CAEmitterLayerRenderMode

    public let value: KeyValueType?
    public static var keyPath: String { return "renderMode" }

    public init(_ value: KeyValueType) {
        self.value = value
    }
}
