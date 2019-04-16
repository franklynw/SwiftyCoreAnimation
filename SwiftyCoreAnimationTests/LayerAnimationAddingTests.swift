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
        let animationDescriptor = Descriptor.Basic<BorderColor>.from(from, by: by, duration: duration, key: "animation")

        // should be fine to add a borderColor animation to any kind of layer

        var animations: [CABasicAnimation] = []

        // we can't use an array of CALayer because it won't call the functions specific to layer types

        self.layer.addAnimation(describedBy: animationDescriptor)
        animations.append(self.layer.animation(forKey: "animation") as! CABasicAnimation)
        self.shapeLayer.addAnimation(describedBy: animationDescriptor)
        animations.append(self.shapeLayer.animation(forKey: "animation") as! CABasicAnimation)
        self.emitterLayer.addAnimation(describedBy: animationDescriptor)
        animations.append(self.emitterLayer.animation(forKey: "animation") as! CABasicAnimation)
        self.gradientLayer.addAnimation(describedBy: animationDescriptor)
        animations.append(self.gradientLayer.animation(forKey: "animation") as! CABasicAnimation)
        self.replicatorLayer.addAnimation(describedBy: animationDescriptor)
        animations.append(self.replicatorLayer.animation(forKey: "animation") as! CABasicAnimation)
        self.textLayer.addAnimation(describedBy: animationDescriptor)
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
        let animationDescriptor = Descriptor.KeyFrame<BorderColor>.values(values, duration: duration, key: "animation")

        var animations: [CAKeyframeAnimation] = []

        self.layer.addAnimation(describedBy: animationDescriptor)
        animations.append(self.layer.animation(forKey: "animation") as! CAKeyframeAnimation)
        self.shapeLayer.addAnimation(describedBy: animationDescriptor)
        animations.append(self.shapeLayer.animation(forKey: "animation") as! CAKeyframeAnimation)
        self.emitterLayer.addAnimation(describedBy: animationDescriptor)
        animations.append(self.emitterLayer.animation(forKey: "animation") as! CAKeyframeAnimation)
        self.gradientLayer.addAnimation(describedBy: animationDescriptor)
        animations.append(self.gradientLayer.animation(forKey: "animation") as! CAKeyframeAnimation)
        self.replicatorLayer.addAnimation(describedBy: animationDescriptor)
        animations.append(self.replicatorLayer.animation(forKey: "animation") as! CAKeyframeAnimation)
        self.textLayer.addAnimation(describedBy: animationDescriptor)
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
        let animationDescriptor = Descriptor.Spring<BorderColor>.from(from, to: to, duration: duration, key: "animation")

        var animations: [CASpringAnimation] = []

        self.layer.addAnimation(describedBy: animationDescriptor)
        animations.append(self.layer.animation(forKey: "animation") as! CASpringAnimation)
        self.shapeLayer.addAnimation(describedBy: animationDescriptor)
        animations.append(self.shapeLayer.animation(forKey: "animation") as! CASpringAnimation)
        self.emitterLayer.addAnimation(describedBy: animationDescriptor)
        animations.append(self.emitterLayer.animation(forKey: "animation") as! CASpringAnimation)
        self.gradientLayer.addAnimation(describedBy: animationDescriptor)
        animations.append(self.gradientLayer.animation(forKey: "animation") as! CASpringAnimation)
        self.replicatorLayer.addAnimation(describedBy: animationDescriptor)
        animations.append(self.replicatorLayer.animation(forKey: "animation") as! CASpringAnimation)
        self.textLayer.addAnimation(describedBy: animationDescriptor)
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

        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2, key: "anchorPoint")
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFramePositionDescriptor = Descriptor.KeyFrame<SwiftyCoreAnimation.Position>.path(path, duration: 4, key: "position")

        let groupDescriptor = Descriptor.Group.Concurrent(using: [basicAnchorPointDescriptor, keyFramePositionDescriptor])

        XCTAssertEqual(groupDescriptor.duration, 4, "Group's duration should be the same as longest animation")

        var animations: [CAPropertyAnimation] = []

        do {
            try self.layer.addAnimationsGroup(describedBy: groupDescriptor)
            animations.append(self.layer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
            try self.shapeLayer.addAnimationsGroup(describedBy: groupDescriptor)
            animations.append(self.shapeLayer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
            try self.emitterLayer.addAnimationsGroup(describedBy: groupDescriptor)
            animations.append(self.emitterLayer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
            try self.gradientLayer.addAnimationsGroup(describedBy: groupDescriptor)
            animations.append(self.gradientLayer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
            try self.replicatorLayer.addAnimationsGroup(describedBy: groupDescriptor)
            animations.append(self.replicatorLayer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
            try self.textLayer.addAnimationsGroup(describedBy: groupDescriptor)
            animations.append(self.textLayer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
        } catch {
            XCTFail("Animation groups should have been created: " + error.localizedDescription)
        }

        animations.forEach {
            XCTAssertEqual($0.duration, 2, "AnchorPoint animation in group should have duration 2")
        }

        // also test that we can't add group animations to layers without the animating properties

        let fillColorDescriptor = Descriptor.Basic<FillColor>.from(.red, to: .green, duration: 2)
        let gradientColorsDescriptor = Descriptor.Basic<Colors>.from([.red, .green], to: [.blue, .yellow], duration: 4)

        let groupDescriptor2 = Descriptor.Group.Concurrent(using: [fillColorDescriptor, keyFramePositionDescriptor])
        let groupDescriptor3 = Descriptor.Group.Concurrent(using: [gradientColorsDescriptor, keyFramePositionDescriptor])

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

        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2, key: "anchorPoint")
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFramePositionDescriptor = Descriptor.KeyFrame<SwiftyCoreAnimation.Position>.path(path, duration: 4, key: "position")

        var animations: [CAPropertyAnimation] = []

        do {
            try self.layer.addConcurrentAnimations(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor])
            animations.append(self.layer.animation(forKey: "position") as! CAPropertyAnimation)
            try self.shapeLayer.addConcurrentAnimations(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor])
            animations.append(self.shapeLayer.animation(forKey: "position") as! CAPropertyAnimation)
            try self.emitterLayer.addConcurrentAnimations(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor])
            animations.append(self.emitterLayer.animation(forKey: "position") as! CAPropertyAnimation)
            try self.gradientLayer.addConcurrentAnimations(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor])
            animations.append(self.gradientLayer.animation(forKey: "position") as! CAPropertyAnimation)
            try self.replicatorLayer.addConcurrentAnimations(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor])
            animations.append(self.replicatorLayer.animation(forKey: "position") as! CAPropertyAnimation)
            try self.textLayer.addConcurrentAnimations(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor])
            animations.append(self.textLayer.animation(forKey: "position") as! CAPropertyAnimation)
        } catch {
            XCTFail("Animation groups should have been created: " + error.localizedDescription)
        }

        animations.forEach {
            XCTAssertEqual($0.duration, 4, "Position animation in group should have duration 4")
        }

        // also test that we can't add group animations to layers without the animating properties

        let fillColorDescriptor = Descriptor.Basic<FillColor>.from(.red, to: .green)
        let gradientColorsDescriptor = Descriptor.Basic<Colors>.from([.red, .green], to: [.blue, .yellow])

        do {
            try self.layer.addConcurrentAnimations(describedBy: [fillColorDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add fillColor animation to CALayer")
        } catch {
            // success
        }

        do {
            try self.shapeLayer.addConcurrentAnimations(describedBy: [gradientColorsDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add gradient colors animation to CAShapeLayer")
        } catch {
            // success
        }

        do {
            try self.emitterLayer.addConcurrentAnimations(describedBy: [fillColorDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add fillColor animation to CAEmitterLayer")
        } catch {
            // success
        }

        do {
            try self.gradientLayer.addConcurrentAnimations(describedBy: [fillColorDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add fillColor animation to CAGradientLayer")
        } catch {
            // success
        }

        do {
            try self.replicatorLayer.addConcurrentAnimations(describedBy: [fillColorDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add fillColor animation to CAReplicatorLayer")
        } catch {
            // success
        }

        do {
            try self.textLayer.addConcurrentAnimations(describedBy: [fillColorDescriptor, keyFramePositionDescriptor])
            XCTFail("Shouldn't be able to add fillColor animation to CATextLayer")
        } catch {
            // success
        }
    }

    func testSequentialAnimationGroupAdding() {

        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2, key: "anchorPoint")
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFramePositionDescriptor = Descriptor.KeyFrame<SwiftyCoreAnimation.Position>.path(path, duration: 4, key: "position")

        let groupDescriptor = Descriptor.Group.Sequential(using: [basicAnchorPointDescriptor, keyFramePositionDescriptor])

        var animations: [CAPropertyAnimation] = []

        do {
            try self.layer.addAnimationsGroup(describedBy: groupDescriptor)
            animations.append(self.layer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
            try self.shapeLayer.addAnimationsGroup(describedBy: groupDescriptor)
            animations.append(self.shapeLayer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
            try self.emitterLayer.addAnimationsGroup(describedBy: groupDescriptor)
            animations.append(self.emitterLayer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
            try self.gradientLayer.addAnimationsGroup(describedBy: groupDescriptor)
            animations.append(self.gradientLayer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
            try self.replicatorLayer.addAnimationsGroup(describedBy: groupDescriptor)
            animations.append(self.replicatorLayer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
            try self.textLayer.addAnimationsGroup(describedBy: groupDescriptor)
            animations.append(self.textLayer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
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

        let groupDescriptor2 = Descriptor.Group.Sequential(using: [fillColorDescriptor, keyFramePositionDescriptor])
        let groupDescriptor3 = Descriptor.Group.Sequential(using: [gradientColorsDescriptor, keyFramePositionDescriptor])

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

        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2, key: "anchorPoint")
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFramePositionDescriptor = Descriptor.KeyFrame<SwiftyCoreAnimation.Position>.path(path, duration: 4, key: "position")

        var animations: [CAPropertyAnimation] = []

        do {
            try self.layer.addAnimationSequence(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor])
            animations.append(self.layer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
            try self.shapeLayer.addAnimationSequence(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor])
            animations.append(self.shapeLayer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
            try self.emitterLayer.addAnimationSequence(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor])
            animations.append(self.emitterLayer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
            try self.gradientLayer.addAnimationSequence(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor])
            animations.append(self.gradientLayer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
            try self.replicatorLayer.addAnimationSequence(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor])
            animations.append(self.replicatorLayer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
            try self.textLayer.addAnimationSequence(describedBy: [basicAnchorPointDescriptor, keyFramePositionDescriptor])
            animations.append(self.textLayer.animation(forKey: "anchorPoint") as! CAPropertyAnimation)
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
        let basicAnimation = basicAnimationDescriptor.animation as! CABasicAnimation

        let layers: [CALayer] = [self.layer, self.shapeLayer, self.emitterLayer, self.gradientLayer, self.replicatorLayer, self.textLayer]

        layers.forEach {
            $0.addAnimation(basicAnimation, forKey: "basicAnimation")
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
        let keyFrameAnimation = keyFrameAnimationDescriptor.animation as! CAKeyframeAnimation

        layers.forEach {
            $0.addAnimation(keyFrameAnimation, forKey: "keyFrameAnimation")
        }

        // test that we've actually added the animations to the layers

        layers.forEach {
            let layerKeyFrameAnimation: CAKeyframeAnimation = $0.animation(forKey: "keyFrameAnimation") as! CAKeyframeAnimation

            let keyFrameAnimationValues: [UIColor] = (layerKeyFrameAnimation.values as! [CGColor]).map { UIColor(cgColor: $0) }
            XCTAssertEqual(keyFrameAnimationValues, values, "Should be equal for \($0)")
            XCTAssertEqual(layerKeyFrameAnimation.duration, duration, "Should be equal for \($0)")
        }


        let springAnimationDescriptor = Descriptor.Spring<BorderColor>.from(from, by: by, duration: duration)
        let springAnimation = springAnimationDescriptor.animation as! CASpringAnimation

        layers.forEach {
            $0.addAnimation(springAnimation, forKey: "springAnimation")
        }

        // test that we've actually added the animations to the layers

        layers.forEach {
            let layerSpringAnimation: CASpringAnimation = $0.animation(forKey: "springAnimation") as! CASpringAnimation

            XCTAssertEqual(layerSpringAnimation.fromValue as! CGColor, from.cgColor, "Should be equal for \($0)")
            XCTAssertEqual(layerSpringAnimation.byValue as! CGColor, by.cgColor, "Should be equal for \($0)")
            XCTAssertEqual(layerSpringAnimation.duration, duration, "Should be equal for \($0)")
        }


        let transitionDescriptor = Descriptor.Transition(type: .push, startProgress: 0, endProgress: 1, duration: duration)
        let transition = transitionDescriptor.animation as! CATransition

        layers.forEach {
            $0.addTransition(transition, forKey: "transition")
        }

        // test that we've actually added the transitions to the layers

        layers.forEach {
            let layerTransition: CATransition = $0.animation(forKey: "transition") as! CATransition

            XCTAssertEqual(layerTransition.startProgress, 0, "Should be equal for \($0)")
            XCTAssertEqual(layerTransition.endProgress, 1, "Should be equal for \($0)")
            XCTAssertEqual(layerTransition.duration, duration, "Should be equal for \($0)")
        }
    }
}
