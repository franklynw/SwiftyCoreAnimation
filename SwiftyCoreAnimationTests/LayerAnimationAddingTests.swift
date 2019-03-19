//
//  LayerAnimationAddingTests.swift
//  SwiftyCoreAnimationTests
//
//  Created by Franklyn on 07/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import XCTest
@testable import SwiftyCoreAnimation


class LayerAnimationAddingTests: XCTestCase {

    // test that we can add animations to all layer types
    
    private lazy var layer: CALayer = {
        return CALayer()
    }()
    private lazy var shapeLayer: CAShapeLayer = {
        return CAShapeLayer()
    }()
    private lazy var emitterLayer: CAEmitterLayer = {
        return CAEmitterLayer()
    }()
    private lazy var gradientLayer: CAGradientLayer = {
        return CAGradientLayer()
    }()
    private lazy var replicatorLayer: CAReplicatorLayer = {
        return CAReplicatorLayer()
    }()
    private lazy var textLayer: CATextLayer = {
        return CATextLayer()
    }()


    func testLayerBasicAnimationAdding() {

        let from: UIColor = .red
        let by: UIColor = .green
        let duration: TimeInterval = 2
        let animationDescriptor = Descriptor.Basic<BorderColor>.from(from, by: by, duration: duration)

        // should be fine to add a borderColor animation to any kind of layer

        var animations: [CABasicAnimation] = []

        // we can't use an array of CALayer because it won't call the functions specific to layer types

        animations.append(self.layer.addBasicAnimation(describedBy: animationDescriptor))
        animations.append(self.shapeLayer.addBasicAnimation(describedBy: animationDescriptor))
        animations.append(self.emitterLayer.addBasicAnimation(describedBy: animationDescriptor))
        animations.append(self.gradientLayer.addBasicAnimation(describedBy: animationDescriptor))
        animations.append(self.replicatorLayer.addBasicAnimation(describedBy: animationDescriptor))
        animations.append(self.textLayer.addBasicAnimation(describedBy: animationDescriptor))

        animations.forEach {
            XCTAssertEqual($0.fromValue as! CGColor, from.cgColor, "Should be equal for \($0)")
            XCTAssertEqual($0.byValue as! CGColor, by.cgColor, "Should be equal for \($0)")
            XCTAssertEqual($0.duration, duration, "Should be equal for \($0)")
        }
    }

    func testLayerKeyFrameAnimationAdding() {

        let values: [UIColor] = [.red, .green, .purple]
        let duration: TimeInterval = 4
        let animationDescriptor = Descriptor.KeyFrame<BorderColor>.values(values, duration: duration)

        var animations: [CAKeyframeAnimation] = []

        animations.append(self.layer.addKeyFrameAnimation(describedBy: animationDescriptor))
        animations.append(self.shapeLayer.addKeyFrameAnimation(describedBy: animationDescriptor))
        animations.append(self.emitterLayer.addKeyFrameAnimation(describedBy: animationDescriptor))
        animations.append(self.gradientLayer.addKeyFrameAnimation(describedBy: animationDescriptor))
        animations.append(self.replicatorLayer.addKeyFrameAnimation(describedBy: animationDescriptor))
        animations.append(self.textLayer.addKeyFrameAnimation(describedBy: animationDescriptor))

        animations.forEach {
            let animationValues: [UIColor] = ($0.values as! [CGColor]).map { UIColor(cgColor: $0) }
            XCTAssertEqual(animationValues, values, "Should be equal for \($0)")
            XCTAssertEqual($0.duration, duration, "Should be equal for \($0)")
        }
    }

    func testLayerSpringAnimationAdding() {

        let from: UIColor = .red
        let to: UIColor = .green
        let duration: TimeInterval = 2
        let animationDescriptor = Descriptor.Spring<BorderColor>.from(from, to: to, duration: duration)

        var animations: [CASpringAnimation] = []

        animations.append(self.layer.addSpringAnimation(describedBy: animationDescriptor))
        animations.append(self.shapeLayer.addSpringAnimation(describedBy: animationDescriptor))
        animations.append(self.emitterLayer.addSpringAnimation(describedBy: animationDescriptor))
        animations.append(self.gradientLayer.addSpringAnimation(describedBy: animationDescriptor))
        animations.append(self.replicatorLayer.addSpringAnimation(describedBy: animationDescriptor))
        animations.append(self.textLayer.addSpringAnimation(describedBy: animationDescriptor))

        animations.forEach {
            XCTAssertEqual($0.fromValue as! CGColor, from.cgColor, "Should be equal for \($0)")
            XCTAssertEqual($0.toValue as! CGColor, to.cgColor, "Should be equal for \($0)")
            XCTAssertEqual($0.duration, duration, "Should be equal for \($0)")
        }
    }

    func testTransitionAnimationAdding() {

        let type: CATransitionType = .fade
        let subtype: CATransitionSubtype = .fromTop
        let start: CGFloat = 0.1
        let end: CGFloat = 0.8
        let duration: TimeInterval = 2
        let transitionDescriptor = Descriptor.Transition(type: type, subtype: subtype, startProgress: start, endProgress: end, duration: duration)

        var animations: [CATransition] = []

        animations.append(self.layer.addTransition(describedBy: transitionDescriptor))
        animations.append(self.shapeLayer.addTransition(describedBy: transitionDescriptor))
        animations.append(self.emitterLayer.addTransition(describedBy: transitionDescriptor))
        animations.append(self.gradientLayer.addTransition(describedBy: transitionDescriptor))
        animations.append(self.replicatorLayer.addTransition(describedBy: transitionDescriptor))
        animations.append(self.textLayer.addTransition(describedBy: transitionDescriptor))

        animations.forEach {
            XCTAssertEqual($0.type, type, "Should be equal for \($0)")
            XCTAssertEqual($0.subtype, subtype, "Should be equal for \($0)")
            XCTAssertEqual($0.startProgress, Float(start), "Should be equal for \($0)")
            XCTAssertEqual($0.endProgress, Float(end), "Should be equal for \($0)")
            XCTAssertEqual($0.duration, duration, "Should be equal for \($0)")
        }
    }

    func testCALayerAnimationAdding() {

        let from: UIColor = .red
        let by: UIColor = .green
        let duration: TimeInterval = 2
        let basicAnimationDescriptor = Descriptor.Basic<BorderColor>.from(from, by: by, duration: duration)
        let basicAnimation = basicAnimationDescriptor.animation

        let layers: [CALayer] = [self.layer, self.shapeLayer, self.emitterLayer, self.gradientLayer, self.replicatorLayer, self.textLayer]

        layers.forEach {
            $0.addBasicAnimation(basicAnimation, forKey: "basicAnimation")
        }

        // test that we've actually added the animations to the layers

        layers.forEach {
            let layerBasicAnimation: CABasicAnimation = $0.animation(forKey: "basicAnimation") as! CABasicAnimation

            XCTAssertEqual(layerBasicAnimation.fromValue as! CGColor, from.cgColor, "Should be equal for \($0)")
            XCTAssertEqual(layerBasicAnimation.byValue as! CGColor, by.cgColor, "Should be equal for \($0)")
            XCTAssertEqual(layerBasicAnimation.duration, duration, "Should be equal for \($0)")
        }


        let values: [UIColor] = [.red, .green, .purple]
        let keyFrameAnimationDescriptor = Descriptor.KeyFrame<BorderColor>.values(values, duration: duration)
        let keyFrameAnimation = keyFrameAnimationDescriptor.animation

        layers.forEach {
            $0.addKeyFrameAnimation(keyFrameAnimation, forKey: "keyFrameAnimation")
        }

        // test that we've actually added the animations to the layers

        layers.forEach {
            let layerKeyFrameAnimation: CAKeyframeAnimation = $0.animation(forKey: "keyFrameAnimation") as! CAKeyframeAnimation

            let keyFrameAnimationValues: [UIColor] = (layerKeyFrameAnimation.values as! [CGColor]).map { UIColor(cgColor: $0) }
            XCTAssertEqual(keyFrameAnimationValues, values, "Should be equal for \($0)")
            XCTAssertEqual(layerKeyFrameAnimation.duration, duration, "Should be equal for \($0)")
        }


        let springAnimationDescriptor = Descriptor.Spring<BorderColor>.from(from, by: by, duration: duration)
        let springAnimation = springAnimationDescriptor.animation

        layers.forEach {
            $0.addSpringAnimation(springAnimation, forKey: "springAnimation")
        }

        // test that we've actually added the animations to the layers

        layers.forEach {
            let layerSpringAnimation: CASpringAnimation = $0.animation(forKey: "springAnimation") as! CASpringAnimation

            XCTAssertEqual(layerSpringAnimation.fromValue as! CGColor, from.cgColor, "Should be equal for \($0)")
            XCTAssertEqual(layerSpringAnimation.byValue as! CGColor, by.cgColor, "Should be equal for \($0)")
            XCTAssertEqual(layerSpringAnimation.duration, duration, "Should be equal for \($0)")
        }
    }
}
