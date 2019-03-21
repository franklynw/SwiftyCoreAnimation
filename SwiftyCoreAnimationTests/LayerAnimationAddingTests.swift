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

        self.layer.addBasicAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.layer.animation(forKey: "animation") as! CABasicAnimation)
        self.shapeLayer.addBasicAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.shapeLayer.animation(forKey: "animation") as! CABasicAnimation)
        self.emitterLayer.addBasicAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.emitterLayer.animation(forKey: "animation") as! CABasicAnimation)
        self.gradientLayer.addBasicAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.gradientLayer.animation(forKey: "animation") as! CABasicAnimation)
        self.replicatorLayer.addBasicAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.replicatorLayer.animation(forKey: "animation") as! CABasicAnimation)
        self.textLayer.addBasicAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.textLayer.animation(forKey: "animation") as! CABasicAnimation)

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

        self.layer.addKeyFrameAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.layer.animation(forKey: "animation") as! CAKeyframeAnimation)
        self.shapeLayer.addKeyFrameAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.shapeLayer.animation(forKey: "animation") as! CAKeyframeAnimation)
        self.emitterLayer.addKeyFrameAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.emitterLayer.animation(forKey: "animation") as! CAKeyframeAnimation)
        self.gradientLayer.addKeyFrameAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.gradientLayer.animation(forKey: "animation") as! CAKeyframeAnimation)
        self.replicatorLayer.addKeyFrameAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.replicatorLayer.animation(forKey: "animation") as! CAKeyframeAnimation)
        self.textLayer.addKeyFrameAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.textLayer.animation(forKey: "animation") as! CAKeyframeAnimation)

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

        self.layer.addSpringAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.layer.animation(forKey: "animation") as! CASpringAnimation)
        self.shapeLayer.addSpringAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.shapeLayer.animation(forKey: "animation") as! CASpringAnimation)
        self.emitterLayer.addSpringAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.emitterLayer.animation(forKey: "animation") as! CASpringAnimation)
        self.gradientLayer.addSpringAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.gradientLayer.animation(forKey: "animation") as! CASpringAnimation)
        self.replicatorLayer.addSpringAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.replicatorLayer.animation(forKey: "animation") as! CASpringAnimation)
        self.textLayer.addSpringAnimation(describedBy: animationDescriptor, forKey: "animation")
        animations.append(self.textLayer.animation(forKey: "animation") as! CASpringAnimation)

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

        self.layer.addTransition(describedBy: transitionDescriptor)
        animations.append(self.layer.animation(forKey: "transition") as! CATransition)
        self.shapeLayer.addTransition(describedBy: transitionDescriptor)
        animations.append(self.shapeLayer.animation(forKey: "transition") as! CATransition)
        self.emitterLayer.addTransition(describedBy: transitionDescriptor)
        animations.append(self.emitterLayer.animation(forKey: "transition") as! CATransition)
        self.gradientLayer.addTransition(describedBy: transitionDescriptor)
        animations.append(self.gradientLayer.animation(forKey: "transition") as! CATransition)
        self.replicatorLayer.addTransition(describedBy: transitionDescriptor)
        animations.append(self.replicatorLayer.animation(forKey: "transition") as! CATransition)
        self.textLayer.addTransition(describedBy: transitionDescriptor)
        animations.append(self.textLayer.animation(forKey: "transition") as! CATransition)

        animations.forEach {
            XCTAssertEqual($0.type, type, "Should be equal for \($0)")
            XCTAssertEqual($0.subtype, subtype, "Should be equal for \($0)")
            XCTAssertEqual($0.startProgress, Float(start), "Should be equal for \($0)")
            XCTAssertEqual($0.endProgress, Float(end), "Should be equal for \($0)")
            XCTAssertEqual($0.duration, duration, "Should be equal for \($0)")
        }
    }

    func testConcurrentAnimationGroupAdding() {

        let duration: TimeInterval = 2
        let basicAnchorPointDescriptor = SwiftyCoreAnimation.Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>()
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFramePositionDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.Position>.path(path, duration: 4)

        let groupDescriptor = Descriptor.Group.concurrent(using: [basicAnchorPointDescriptor, keyFramePositionDescriptor], duration: duration)

        var animations: [CAAnimationGroup] = []

        do {
            try self.layer.addAnimationsGroup(describedBy: groupDescriptor, forKey: "animation")
            animations.append(self.layer.animation(forKey: "animation") as! CAAnimationGroup)
            try self.shapeLayer.addAnimationsGroup(describedBy: groupDescriptor, forKey: "animation")
            animations.append(self.shapeLayer.animation(forKey: "animation") as! CAAnimationGroup)
            try self.emitterLayer.addAnimationsGroup(describedBy: groupDescriptor, forKey: "animation")
            animations.append(self.emitterLayer.animation(forKey: "animation") as! CAAnimationGroup)
            try self.gradientLayer.addAnimationsGroup(describedBy: groupDescriptor, forKey: "animation")
            animations.append(self.gradientLayer.animation(forKey: "animation") as! CAAnimationGroup)
            try self.replicatorLayer.addAnimationsGroup(describedBy: groupDescriptor, forKey: "animation")
            animations.append(self.replicatorLayer.animation(forKey: "animation") as! CAAnimationGroup)
            try self.textLayer.addAnimationsGroup(describedBy: groupDescriptor, forKey: "animation")
            animations.append(self.textLayer.animation(forKey: "animation") as! CAAnimationGroup)
        } catch {
            XCTFail("Animation groups should have been created: " + error.localizedDescription)
        }

        animations.forEach {
            XCTAssertEqual($0.duration, duration, "Should be equal for group \($0)")
            XCTAssertEqual($0.animations?.count, 2, "Should be 2 animations in group \($0)")
        }

        // also test that we can't add group animations to layers without the animating properties

        let fillColorDescriptor = Descriptor.Basic<FillColor>.from(.red, to: .green)
        let gradientColorsDescriptor = Descriptor.Basic<Colors>.from([.red, .green], to: [.blue, .yellow])

        let groupDescriptor2 = Descriptor.Group.concurrent(using: [fillColorDescriptor, keyFramePositionDescriptor], duration: duration)
        let groupDescriptor3 = Descriptor.Group.concurrent(using: [gradientColorsDescriptor, keyFramePositionDescriptor], duration: duration)

        do {
            try self.layer.addAnimationsGroup(describedBy: groupDescriptor2)
            XCTFail("Shouldn't be able to add fillColor animation to CALayer")
        } catch {
            // success
        }

        do {
            try self.shapeLayer.addAnimationsGroup(describedBy: groupDescriptor3)
            XCTFail("Shouldn't be able to add gradient colors animation to CAShapeLayer")
        } catch {
            // success
        }

        do {
            try self.emitterLayer.addAnimationsGroup(describedBy: groupDescriptor2)
            XCTFail("Shouldn't be able to add fillColor animation to CAEmitterLayer")
        } catch {
            // success
        }

        do {
            try self.gradientLayer.addAnimationsGroup(describedBy: groupDescriptor2)
            XCTFail("Shouldn't be able to add fillColor animation to CAGradientLayer")
        } catch {
            // success
        }

        do {
            try self.replicatorLayer.addAnimationsGroup(describedBy: groupDescriptor2)
            XCTFail("Shouldn't be able to add fillColor animation to CAReplicatorLayer")
        } catch {
            // success
        }

        do {
            try self.textLayer.addAnimationsGroup(describedBy: groupDescriptor2)
            XCTFail("Shouldn't be able to add fillColor animation to CATextLayer")
        } catch {
            // success
        }
    }

    func testConcurrentAnimationGroupAddingVersion2() {

        let duration: TimeInterval = 2
        let basicAnchorPointDescriptor = SwiftyCoreAnimation.Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>()
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFramePositionDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.Position>.path(path, duration: 4)

        var animations: [CAAnimationGroup] = []

        do {
            try self.layer.addConcurrentAnimationsGroup(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor], forKey: "animation", duration: duration)
            animations.append(self.layer.animation(forKey: "animation") as! CAAnimationGroup)
            try self.shapeLayer.addConcurrentAnimationsGroup(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor], forKey: "animation", duration: duration)
            animations.append(self.shapeLayer.animation(forKey: "animation") as! CAAnimationGroup)
            try self.emitterLayer.addConcurrentAnimationsGroup(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor], forKey: "animation", duration: duration)
            animations.append(self.emitterLayer.animation(forKey: "animation") as! CAAnimationGroup)
            try self.gradientLayer.addConcurrentAnimationsGroup(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor], forKey: "animation", duration: duration)
            animations.append(self.gradientLayer.animation(forKey: "animation") as! CAAnimationGroup)
            try self.replicatorLayer.addConcurrentAnimationsGroup(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor], forKey: "animation", duration: duration)
            animations.append(self.replicatorLayer.animation(forKey: "animation") as! CAAnimationGroup)
            try self.textLayer.addConcurrentAnimationsGroup(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor], forKey: "animation", duration: duration)
            animations.append(self.textLayer.animation(forKey: "animation") as! CAAnimationGroup)
        } catch {
            XCTFail("Animation groups should have been created: " + error.localizedDescription)
        }

        animations.forEach {
            XCTAssertEqual($0.duration, duration, "Should be equal for group \($0)")
            XCTAssertEqual($0.animations?.count, 2, "Should be 2 animations in group \($0)")
        }

        // also test that we can't add group animations to layers without the animating properties

        let fillColorDescriptor = Descriptor.Basic<FillColor>.from(.red, to: .green)
        let gradientColorsDescriptor = Descriptor.Basic<Colors>.from([.red, .green], to: [.blue, .yellow])

        do {
            try self.layer.addConcurrentAnimationsGroup(describedBy: [fillColorDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add fillColor animation to CALayer")
        } catch {
            // success
        }

        do {
            try self.shapeLayer.addConcurrentAnimationsGroup(describedBy: [gradientColorsDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add gradient colors animation to CAShapeLayer")
        } catch {
            // success
        }

        do {
            try self.emitterLayer.addConcurrentAnimationsGroup(describedBy: [fillColorDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add fillColor animation to CAEmitterLayer")
        } catch {
            // success
        }

        do {
            try self.gradientLayer.addConcurrentAnimationsGroup(describedBy: [fillColorDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add fillColor animation to CAGradientLayer")
        } catch {
            // success
        }

        do {
            try self.replicatorLayer.addConcurrentAnimationsGroup(describedBy: [fillColorDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add fillColor animation to CAReplicatorLayer")
        } catch {
            // success
        }

        do {
            try self.textLayer.addConcurrentAnimationsGroup(describedBy: [fillColorDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add fillColor animation to CATextLayer")
        } catch {
            // success
        }
    }

    func testSequentialAnimationGroupAdding() {

        let basicAnchorPointDescriptor = SwiftyCoreAnimation.Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2)
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFramePositionDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.Position>.path(path, duration: 4)

        let groupDescriptor = Descriptor.Group.sequential(using: [basicAnchorPointDescriptor, keyFramePositionDescriptor])

        var animations: [CAPropertyAnimation] = []

        do {
            try self.layer.addAnimationsGroup(describedBy: groupDescriptor, forKey: "animation")
            animations.append(self.layer.animation(forKey: "animation") as! CAPropertyAnimation)
            try self.shapeLayer.addAnimationsGroup(describedBy: groupDescriptor, forKey: "animation")
            animations.append(self.shapeLayer.animation(forKey: "animation") as! CAPropertyAnimation)
            try self.emitterLayer.addAnimationsGroup(describedBy: groupDescriptor, forKey: "animation")
            animations.append(self.emitterLayer.animation(forKey: "animation") as! CAPropertyAnimation)
            try self.gradientLayer.addAnimationsGroup(describedBy: groupDescriptor, forKey: "animation")
            animations.append(self.gradientLayer.animation(forKey: "animation") as! CAPropertyAnimation)
            try self.replicatorLayer.addAnimationsGroup(describedBy: groupDescriptor, forKey: "animation")
            animations.append(self.replicatorLayer.animation(forKey: "animation") as! CAPropertyAnimation)
            try self.textLayer.addAnimationsGroup(describedBy: groupDescriptor, forKey: "animation")
            animations.append(self.textLayer.animation(forKey: "animation") as! CAPropertyAnimation)
        } catch {
            XCTFail("Animation sequences should have been created: " + error.localizedDescription)
        }

        animations.forEach {
            XCTAssertEqual($0.duration, 2, "Should be equal for 1st animation \($0)")
            XCTAssertEqual($0.keyPath, AnchorPoint.X.keyPath, "Should be equal for 1st animation \($0)")
        }

        // also test that we can't add group animations to layers without the animating properties

        let fillColorDescriptor = Descriptor.Basic<FillColor>.from(.red, to: .green)
        let gradientColorsDescriptor = Descriptor.Basic<Colors>.from([.red, .green], to: [.blue, .yellow])

        let groupDescriptor2 = Descriptor.Group.sequential(using: [fillColorDescriptor, keyFramePositionDescriptor])
        let groupDescriptor3 = Descriptor.Group.sequential(using: [gradientColorsDescriptor, keyFramePositionDescriptor])

        do {
            try self.layer.addAnimationsGroup(describedBy: groupDescriptor2)
            XCTFail("Shouldn't be able to add fillColor animation to CALayer")
        } catch {
            // success
        }

        do {
            try self.shapeLayer.addAnimationsGroup(describedBy: groupDescriptor3)
            XCTFail("Shouldn't be able to add gradient colors animation to CAShapeLayer")
        } catch {
            // success
        }

        do {
            try self.emitterLayer.addAnimationsGroup(describedBy: groupDescriptor2)
            XCTFail("Shouldn't be able to add fillColor animation to CAEmitterLayer")
        } catch {
            // success
        }

        do {
            try self.gradientLayer.addAnimationsGroup(describedBy: groupDescriptor2)
            XCTFail("Shouldn't be able to add fillColor animation to CAGradientLayer")
        } catch {
            // success
        }

        do {
            try self.replicatorLayer.addAnimationsGroup(describedBy: groupDescriptor2)
            XCTFail("Shouldn't be able to add fillColor animation to CAReplicatorLayer")
        } catch {
            // success
        }

        do {
            try self.textLayer.addAnimationsGroup(describedBy: groupDescriptor2)
            XCTFail("Shouldn't be able to add fillColor animation to CATextLayer")
        } catch {
            // success
        }
    }

    func testSequentialAnimationGroupAddingVersion2() {

        let basicAnchorPointDescriptor = SwiftyCoreAnimation.Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2)
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFramePositionDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.Position>.path(path, duration: 4)

        var animations: [CAPropertyAnimation] = []

        do {
            try self.layer.addAnimationSequence(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor], forKey: "animation")
            animations.append(self.layer.animation(forKey: "animation") as! CAPropertyAnimation)
            try self.shapeLayer.addAnimationSequence(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor], forKey: "animation")
            animations.append(self.shapeLayer.animation(forKey: "animation") as! CAPropertyAnimation)
            try self.emitterLayer.addAnimationSequence(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor], forKey: "animation")
            animations.append(self.emitterLayer.animation(forKey: "animation") as! CAPropertyAnimation)
            try self.gradientLayer.addAnimationSequence(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor], forKey: "animation")
            animations.append(self.gradientLayer.animation(forKey: "animation") as! CAPropertyAnimation)
            try self.replicatorLayer.addAnimationSequence(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor], forKey: "animation")
            animations.append(self.replicatorLayer.animation(forKey: "animation") as! CAPropertyAnimation)
            try self.textLayer.addAnimationSequence(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor], forKey: "animation")
            animations.append(self.textLayer.animation(forKey: "animation") as! CAPropertyAnimation)
        } catch {
            XCTFail("Animation sequences should have been created: " + error.localizedDescription)
        }

        animations.forEach {
            XCTAssertEqual($0.duration, 2, "Should be equal for 1st animation \($0)")
            XCTAssertEqual($0.keyPath, AnchorPoint.X.keyPath, "Should be equal for 1st animation \($0)")
        }

        // also test that we can't add group animations to layers without the animating properties

        let fillColorDescriptor = Descriptor.Basic<FillColor>.from(.red, to: .green)
        let gradientColorsDescriptor = Descriptor.Basic<Colors>.from([.red, .green], to: [.blue, .yellow])

        do {
            try self.layer.addAnimationSequence(describedBy: [fillColorDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add fillColor animation to CALayer")
        } catch {
            // success
        }

        do {
            try self.shapeLayer.addAnimationSequence(describedBy: [gradientColorsDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add gradient colors animation to CAShapeLayer")
        } catch {
            // success
        }

        do {
            try self.emitterLayer.addAnimationSequence(describedBy: [fillColorDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add fillColor animation to CAEmitterLayer")
        } catch {
            // success
        }

        do {
            try self.gradientLayer.addAnimationSequence(describedBy: [fillColorDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add fillColor animation to CAGradientLayer")
        } catch {
            // success
        }

        do {
            try self.replicatorLayer.addAnimationSequence(describedBy: [fillColorDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add fillColor animation to CAReplicatorLayer")
        } catch {
            // success
        }

        do {
            try self.textLayer.addAnimationSequence(describedBy: [fillColorDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add fillColor animation to CATextLayer")
        } catch {
            // success
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
