//
//  RandomStuffView.swift
//  SwiftyAnimationDemo
//
//  Created by Franklyn on 11/06/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import UIKit
import SwiftyCoreAnimation


class RandomStuffView: UIView, AnimationsView {

    weak var animationsViewDelegate: AnimationsViewDelegate?

    private static let customPurpleColor = UIColor(hue: 275 / 360, saturation: 0.98, brightness: 0.75, alpha: 1)

    // a fading-out pulse
//    private static let customPurpleColor2 = UIColor(hue: 275 / 360, saturation: 0.2, brightness: 0.75, alpha: 1)

    // for a more vivid 'halo'
    private static let customPurpleColor2 = RandomStuffView.customPurpleColor

    private static let circleDiameter: CGFloat = 100
    private static let circleBounds = CGRect(x: 0, y: 0, width: RandomStuffView.circleDiameter, height: RandomStuffView.circleDiameter)
    private static let circleExpandedBounds = RandomStuffView.circleBounds.inset(by: UIEdgeInsets(top: -20, left: -20, bottom: -20, right: -20))

    private lazy var circleBackgroundLayer: CAShapeLayer = {

        let layer = CAShapeLayer()

        self.layer.addSublayer(layer)

        layer.set(Bounds(type(of: self).circleBounds))
        layer.set(Position(CGPoint(x: self.layer.bounds.width / 2, y: self.layer.bounds.height * 0.8)))

        layer.backgroundColor = type(of: self).customPurpleColor.cgColor
        layer.cornerRadius = type(of: self).circleDiameter / 2

        return layer
    }()

    private lazy var circleLayer: CAShapeLayer = {

        let layer = CAShapeLayer()

        self.layer.addSublayer(layer)

        layer.set(Bounds(type(of: self).circleBounds))
        layer.set(Position(CGPoint(x: self.layer.bounds.width / 2, y: self.layer.bounds.height * 0.8)))
        layer.set(ShadowColor(type(of: self).customPurpleColor))
        layer.set(ShadowOpacity(2))
        layer.set(ShadowOffset(CGSize(width: 0, height: 0)))

        let circlePath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: type(of: self).circleDiameter, height: type(of: self).circleDiameter))
        layer.set(Path(circlePath))
        layer.set(FillColor(.clear))
        layer.set(StrokeColor(type(of: self).customPurpleColor2))

        layer.cornerRadius = type(of: self).circleDiameter / 2

        return layer
    }()

    private lazy var setup: () -> () = {
        // effectively dispatch_once each time the view appears... (has to be a lazy var rather than a let because accessing self)

        self.layer.masksToBounds = true

        _ = self.circleLayer
        _ = self.circleBackgroundLayer

        self.getGoing()

        return {}
    }()

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup() // now that our bounds is right
    }

    deinit {
        print("Deinit RandomStuffView")
    }

    private func getGoing() {

        let repeatProperties: [Properties.MediaTiming] = [.repeatCount(Int.max)]
        let opacityDescriptor = Descriptor.Basic<Opacity>.from(1, to: 0, duration: 1.5, otherAnimationProperties: repeatProperties)
        let sizeDescriptor = Descriptor.Basic<LineWidth>.from(0, to: 60, duration: 1.5, otherAnimationProperties: repeatProperties)
        let shadowRadiusDescriptor = Descriptor.Basic<ShadowRadius>.from(0, to: 30, duration: 1.5, otherAnimationProperties: repeatProperties)
        let pulseGroupDescriptor = Descriptor.Group.Concurrent(using: [opacityDescriptor, sizeDescriptor, shadowRadiusDescriptor])

        try? self.circleLayer.addAnimationsGroup(describedBy: pulseGroupDescriptor, removeExistingAnimations: true)
    }
}
