//
//  AnimationPropertiesTests.swift
//  SwiftyCoreAnimationTests
//
//  Created by Franklyn on 06/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import XCTest
import SceneKit
@testable import SwiftyCoreAnimation


class AnimationPropertiesTests: XCTestCase {

    // Test that we can apply properties to animations
    
    private lazy var layer: CALayer = {
        return CALayer()
    }()

    func testBaseProperties() {

        let isRemovedOnCompletion: Bool = false
        let timingFunction: CAMediaTimingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)

        let properties: [Properties] = [
            Properties.isRemovedOnCompletion(isRemovedOnCompletion),
            Properties.timingFunction(timingFunction)
        ]

        // first of all, test that the descriptor correctly applies the properties to the animation it creates

        let animationDescriptor: Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint> = .from(.zero, to: CGPoint(x: 0.4, y: 0.6), duration: 2, otherAnimationProperties: properties)
        self.layer.addBasicAnimation(describedBy: animationDescriptor)

        let animation = animationDescriptor.animation

        XCTAssertEqual(animation.isRemovedOnCompletion, isRemovedOnCompletion, "Should be equal")
        XCTAssertEqual(animation.timingFunction, timingFunction, "Should be equal")


        // next test that we can apply the properties directly to an existing animation

        let animation2 = CABasicAnimation()

        properties.apply(to: animation2)

        XCTAssertEqual(animation2.isRemovedOnCompletion, isRemovedOnCompletion, "Should be equal")
        XCTAssertEqual(animation2.timingFunction, timingFunction, "Should be equal")


        // now test that we can apply individual properties

        let modifiedIsRemovedOnCompletion: Bool = true
        let modifiedIsRemovedOnCompletionProperty = Properties.isRemovedOnCompletion(modifiedIsRemovedOnCompletion)

        modifiedIsRemovedOnCompletionProperty.apply(to: animation)

        XCTAssertEqual(animation.isRemovedOnCompletion, modifiedIsRemovedOnCompletion, "Should be equal")
    }

    func testTimingProperties() {

        let start: TimeInterval = 0
        let timeOffset: TimeInterval = 5
        let repeatCount: Int = 10
        let repeatDuration: TimeInterval = 3
        let speed: CGFloat = 2
        let autoreverses: Bool = true
        let fillMode: CAMediaTimingFillMode = .forwards

        let timingProperties: [Properties.MediaTiming] = [
            Properties.MediaTiming.beginTime(start),
            Properties.MediaTiming.timeOffset(timeOffset),
            Properties.MediaTiming.repeatCount(repeatCount),
            Properties.MediaTiming.repeatDuration(repeatDuration),
            Properties.MediaTiming.speed(speed),
            Properties.MediaTiming.autoreverses(autoreverses),
            Properties.MediaTiming.fillMode(fillMode)
        ]

        // first of all, test that the descriptor correctly applies the properties to the animation it creates

        let animationDescriptor: Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint> = .from(.zero, to: CGPoint(x: 0.4, y: 0.6), duration: 2, otherAnimationProperties: timingProperties)
        self.layer.addBasicAnimation(describedBy: animationDescriptor)

        let animation = animationDescriptor.animation

        XCTAssertEqual(animation.beginTime, start, "Should be equal")
        XCTAssertEqual(animation.timeOffset, timeOffset, "Should be equal")
        XCTAssertEqual(animation.repeatCount, Float(repeatCount), "Should be equal")
        XCTAssertEqual(animation.repeatDuration, repeatDuration, "Should be equal")
        XCTAssertEqual(animation.speed, Float(speed), "Should be equal")
        XCTAssertEqual(animation.autoreverses, autoreverses, "Should be equal")
        XCTAssertEqual(animation.fillMode, fillMode, "Should be equal")


        // next test that we can apply the properties directly to an existing animation

        let transition = CATransition()

        timingProperties.apply(to: transition)

        XCTAssertEqual(transition.beginTime, start, "Should be equal")
        XCTAssertEqual(transition.timeOffset, timeOffset, "Should be equal")
        XCTAssertEqual(transition.repeatCount, Float(repeatCount), "Should be equal")
        XCTAssertEqual(transition.repeatDuration, repeatDuration, "Should be equal")
        XCTAssertEqual(transition.speed, Float(speed), "Should be equal")
        XCTAssertEqual(transition.autoreverses, autoreverses, "Should be equal")
        XCTAssertEqual(transition.fillMode, fillMode, "Should be equal")


        // now test that we can apply individual properties

        let modifiedStart: TimeInterval = 0.5
        let modifiedBeginTimeProperty = Properties.MediaTiming.beginTime(modifiedStart)

        modifiedBeginTimeProperty.apply(to: animation)

        XCTAssertEqual(animation.beginTime, modifiedStart, "Should be equal")
    }

    func testPropertyProperties() {

        let isCumulative: Bool = true
        let isAdditive: Bool = false
        let valueFunction: CAValueFunction? = CAValueFunction(name: CAValueFunctionName.rotateY)

        let propertyProperties: [Properties.PropertyAnimation] = [
            Properties.PropertyAnimation.isCumulative(isCumulative),
            Properties.PropertyAnimation.isAdditive(isAdditive),
            Properties.PropertyAnimation.valueFunction(valueFunction)
        ]

        // first of all, test that the descriptor correctly applies the properties to the animation it creates

        let animationDescriptor: Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint> = .from(.zero, to: CGPoint(x: 0.4, y: 0.6), duration: 2, otherAnimationProperties: propertyProperties)
        self.layer.addBasicAnimation(describedBy: animationDescriptor)

        let animation = animationDescriptor.animation

        XCTAssertEqual(animation.isCumulative, isCumulative, "Should be equal")
        XCTAssertEqual(animation.isAdditive, isAdditive, "Should be equal")
        XCTAssertEqual(animation.valueFunction, valueFunction, "Should be equal")


        // next test that we can apply the properties directly to an existing animation

        let animation2 = CABasicAnimation()

        propertyProperties.apply(to: animation2)

        XCTAssertEqual(animation2.isCumulative, isCumulative, "Should be equal")
        XCTAssertEqual(animation2.isAdditive, isAdditive, "Should be equal")
        XCTAssertEqual(animation2.valueFunction, valueFunction, "Should be equal")


        // now test that we can apply individual properties

        let modifiedIsCumulative: Bool = true
        let modifiedIsCumulativeProperty = Properties.PropertyAnimation.isCumulative(modifiedIsCumulative)

        modifiedIsCumulativeProperty.apply(to: animation)

        XCTAssertEqual(animation.isCumulative, modifiedIsCumulative, "Should be equal")
    }

    func testKeyFrameProperties() {

        let keyTimes: [CGFloat] = [0, 0.2, 0.4, 0.8, 1]
        let timingFunctions: [CAMediaTimingFunction] = [CAMediaTimingFunction(name: .easeInEaseOut)]
        let calculationMode: CAAnimationCalculationMode = .paced
        let rotationMode: CAAnimationRotationMode = .rotateAutoReverse
        let tensionValues: [CGFloat] = [0, 0.5]
        let continuityValues: [CGFloat] = [0.2, 0.9]
        let biasValues: [CGFloat] = [0.1, 0.6]

        let keyFrameProperties: [Properties.KeyFrameAnimation] = [
            Properties.KeyFrameAnimation.keyTimes(keyTimes),
            Properties.KeyFrameAnimation.timingFunctions(timingFunctions),
            Properties.KeyFrameAnimation.calculationMode(calculationMode),
            Properties.KeyFrameAnimation.rotationMode(rotationMode),
            Properties.KeyFrameAnimation.tensionValues(tensionValues),
            Properties.KeyFrameAnimation.continuityValues(continuityValues),
            Properties.KeyFrameAnimation.biasValues(biasValues)
        ]

        // first of all, test that the descriptor correctly applies the properties to the animation it creates

        let values: [CGPoint] = [CGPoint.zero, CGPoint(x: 0.2, y: 0.4)]
        let animationDescriptor: Descriptor.KeyFrame<SwiftyCoreAnimation.AnchorPoint> = .values(values, duration: 2, otherAnimationProperties: keyFrameProperties)
        self.layer.addKeyFrameAnimation(describedBy: animationDescriptor)

        let animation = animationDescriptor.animation

        XCTAssertEqual(animation.keyTimes?.compactMap { CGFloat($0.doubleValue) }, keyTimes, "Should be equal")
        XCTAssertEqual(animation.timingFunctions, timingFunctions, "Should be equal")
        XCTAssertEqual(animation.calculationMode, calculationMode, "Should be equal")
        XCTAssertEqual(animation.rotationMode, rotationMode, "Should be equal")
        XCTAssertEqual(animation.tensionValues?.compactMap { CGFloat($0.doubleValue) }, tensionValues, "Should be equal")
        XCTAssertEqual(animation.continuityValues?.compactMap { CGFloat($0.doubleValue) }, continuityValues, "Should be equal")
        XCTAssertEqual(animation.biasValues?.compactMap { CGFloat($0.doubleValue) }, biasValues, "Should be equal")


        // next test that we can apply the properties directly to an existing animation

        let animation2 = CAKeyframeAnimation()

        keyFrameProperties.apply(to: animation2)

        XCTAssertEqual(animation2.keyTimes?.compactMap { CGFloat($0.doubleValue) }, keyTimes, "Should be equal")
        XCTAssertEqual(animation2.timingFunctions, timingFunctions, "Should be equal")
        XCTAssertEqual(animation2.calculationMode, calculationMode, "Should be equal")
        XCTAssertEqual(animation2.rotationMode, rotationMode, "Should be equal")
        XCTAssertEqual(animation2.tensionValues?.compactMap { CGFloat($0.doubleValue) }, tensionValues, "Should be equal")
        XCTAssertEqual(animation2.continuityValues?.compactMap { CGFloat($0.doubleValue) }, continuityValues, "Should be equal")
        XCTAssertEqual(animation2.biasValues?.compactMap { CGFloat($0.doubleValue) }, biasValues, "Should be equal")


        // now test that we can apply individual properties

        let modifiedKeyTimes: [CGFloat] = [0.1, 0.3, 0.5, 0.9, 1]
        let modifiedKeyTimesProperty = Properties.KeyFrameAnimation.keyTimes(modifiedKeyTimes)

        modifiedKeyTimesProperty.apply(to: animation)

        XCTAssertEqual(animation.keyTimes?.compactMap { CGFloat($0.doubleValue) }, modifiedKeyTimes, "Should be equal")
    }

    func testSpringProperties() {

        let damping: CGFloat = 0.3
        let initialVelocity: CGFloat = 3
        let mass: CGFloat = 0.9
        let stiffness: CGFloat = 0.6

        let springProperties: [Properties.SpringAnimation] = [
            Properties.SpringAnimation.damping(damping),
            Properties.SpringAnimation.initialVelocity(initialVelocity),
            Properties.SpringAnimation.mass(mass),
            Properties.SpringAnimation.stiffness(stiffness)
        ]

        // first of all, test that the descriptor correctly applies the properties to the animation it creates

        let animationDescriptor: Descriptor.Spring<SwiftyCoreAnimation.AnchorPoint> = .from(.zero, to: CGPoint(x: 0.4, y: 0.6), duration: 2, otherAnimationProperties: springProperties)
        self.layer.addSpringAnimation(describedBy: animationDescriptor)

        let animation = animationDescriptor.animation

        XCTAssertEqual(animation.damping, damping, "Should be equal")
        XCTAssertEqual(animation.initialVelocity, initialVelocity, "Should be equal")
        XCTAssertEqual(animation.mass, mass, "Should be equal")
        XCTAssertEqual(animation.stiffness, stiffness, "Should be equal")


        // next test that we can apply the properties directly to an existing animation

        let animation2 = CASpringAnimation()

        springProperties.apply(to: animation2)

        XCTAssertEqual(animation2.damping, damping, "Should be equal")
        XCTAssertEqual(animation2.initialVelocity, initialVelocity, "Should be equal")
        XCTAssertEqual(animation2.mass, mass, "Should be equal")
        XCTAssertEqual(animation2.stiffness, stiffness, "Should be equal")


        // now test that we can apply individual properties

        let modifiedDamping: CGFloat = 0.7
        let modifiedDampingProperty = Properties.SpringAnimation.damping(modifiedDamping)

        modifiedDampingProperty.apply(to: animation)

        XCTAssertEqual(animation.damping, modifiedDamping, "Should be equal")
    }

    func testSceneKitProperties() {

        let usesSceneTimeBase: Bool = true
        let fadeInDuration: TimeInterval = 2
        let fadeOutDuration: TimeInterval = 3
        let event: SCNAnimationEvent = SCNAnimationEvent(keyTime: 0, block: { _, _, _ in })
        let animationEvents: [SCNAnimationEvent] = [event]

        let sceneKitProperties: [Properties.SceneKit] = [
            Properties.SceneKit.usesSceneTimeBase(usesSceneTimeBase),
            Properties.SceneKit.fadeInDuration(fadeInDuration),
            Properties.SceneKit.fadeOutDuration(fadeOutDuration),
            Properties.SceneKit.animationEvents(animationEvents)
        ]

        // first of all, test that the descriptor correctly applies the properties to the animation it creates

        let animationDescriptor: Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint> = .from(.zero, to: CGPoint(x: 0.4, y: 0.6), duration: 2, otherAnimationProperties: sceneKitProperties)
        self.layer.addBasicAnimation(describedBy: animationDescriptor)

        let animation = animationDescriptor.animation

        XCTAssertEqual(animation.usesSceneTimeBase, usesSceneTimeBase, "Should be equal")
        XCTAssertEqual(animation.fadeInDuration, CGFloat(fadeInDuration), "Should be equal")
        XCTAssertEqual(animation.fadeOutDuration, CGFloat(fadeOutDuration), "Should be equal")
        XCTAssertEqual(animation.animationEvents, animationEvents, "Should be equal")


        // next test that we can apply the properties directly to an existing animation

        let animation2 = CABasicAnimation()

        sceneKitProperties.apply(to: animation2)

        XCTAssertEqual(animation2.usesSceneTimeBase, usesSceneTimeBase, "Should be equal")
        XCTAssertEqual(animation2.fadeInDuration, CGFloat(fadeInDuration), "Should be equal")
        XCTAssertEqual(animation2.fadeOutDuration, CGFloat(fadeOutDuration), "Should be equal")
        XCTAssertEqual(animation2.animationEvents, animationEvents, "Should be equal")


        // now test that we can apply individual properties

        let modifiedFadeInDuration: TimeInterval = 4
        let modifiedFadeInDurationProperty = Properties.SceneKit.fadeInDuration(modifiedFadeInDuration)

        modifiedFadeInDurationProperty.apply(to: animation)

        XCTAssertEqual(animation.fadeInDuration, CGFloat(modifiedFadeInDuration), "Should be equal")
    }
}
