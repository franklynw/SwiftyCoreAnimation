//
//  AnimationActionsTests.swift
//  SwiftyCoreAnimationTests
//
//  Created by Franklyn on 07/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import XCTest
@testable import SwiftyCoreAnimation


class AnimationActionsTests: XCTestCase {

    // tests the Animation Finished closure options for animations

    private lazy var layer: CALayer = {
        return CALayer()
    }()


    func testAnimationFinishedAction() {

        let duration: TimeInterval = 4
        let properties: [Properties] = [
            Properties.isRemovedOnCompletion(true)
        ]
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: duration, otherAnimationProperties: properties)

        let expectation: XCTestExpectation = self.expectation(description: "Animation finished")

        self.layer.addAnimation(describedBy: basicAnchorPointDescriptor) { _, _ in
            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })
    }

    func testAnimationFinishedMultipleActions() {

        let duration: TimeInterval = 4
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: duration)

        let expectation1: XCTestExpectation = self.expectation(description: "Animation finished 1")
        let expectation2: XCTestExpectation = self.expectation(description: "Animation finished 2")

        let animation = basicAnchorPointDescriptor.animation as! CABasicAnimation

        animation.addAnimationDidFinishAction { _, _ in
            expectation1.fulfill()
        }

        animation.addAnimationDidFinishAction { _, _ in
            expectation2.fulfill()
        }

        self.layer.addAnimation(animation)

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })
    }

    func testRemoveAnimationFinishedMultipleActions() {

        let duration: TimeInterval = 4
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: duration)

        let expectation1: XCTestExpectation = self.expectation(description: "Animation finished 1")
        let expectation2: XCTestExpectation = self.expectation(description: "Animation finished 2")

        let animation = basicAnchorPointDescriptor.animation as! CABasicAnimation

        let id1 = animation.addAnimationDidFinishAction { _, _ in
            XCTFail("Shouldn't be called")
            expectation1.fulfill()
            expectation2.fulfill()
        }

        animation.addAnimationDidFinishAction { _, _ in
            expectation1.fulfill()
            expectation2.fulfill()
        }

        animation.removeAnimationAction(withID: id1)

        self.layer.addAnimation(animation)

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })
    }

    func testRemoveAllAnimationFinishedActions() {

        let duration: TimeInterval = 0.5
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: duration)

        let expectation1: XCTestExpectation = self.expectation(description: "Animation finished 1")
        let expectation2: XCTestExpectation = self.expectation(description: "Animation finished 2")

        let animation = basicAnchorPointDescriptor.animation as! CABasicAnimation

        animation.addAnimationDidFinishAction { _, _ in
            XCTFail("Shouldn't be called")
        }

        animation.addAnimationDidFinishAction { _, _ in
            XCTFail("Shouldn't be called")
        }

        animation.removeAllAnimationDidFinishActions()

        self.layer.addAnimation(animation)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            expectation1.fulfill()
            expectation2.fulfill()
        }

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })
    }

    func testAnimationDidBeginAction() {

        let duration: TimeInterval = 4
        let properties: [Properties] = [
            Properties.isRemovedOnCompletion(true)
        ]
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: duration, otherAnimationProperties: properties)

        let expectation1: XCTestExpectation = self.expectation(description: "Animation did begin")

        // test the action added to the descriptor

        basicAnchorPointDescriptor.animationDidBegin = {
             expectation1.fulfill()
        }

        self.layer.addAnimation(describedBy: basicAnchorPointDescriptor)

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })


        // test adding the action to the animation directly

        let nextAnimation = basicAnchorPointDescriptor.animation as! CABasicAnimation
        let expectation2: XCTestExpectation = self.expectation(description: "Animation did begin")

        nextAnimation.addAnimationDidBeginAction {
            expectation2.fulfill()
        }

        self.layer.addAnimation(nextAnimation)

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })
    }

    func testAnimationDidBeginMultipleActions() {

        let duration: TimeInterval = 4
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: duration)

        let expectation1: XCTestExpectation = self.expectation(description: "Animation did begin 1")

        // test the action added to the descriptor

        basicAnchorPointDescriptor.animationDidBegin = {
            expectation1.fulfill()
        }

        self.layer.addAnimation(describedBy: basicAnchorPointDescriptor)


        // test adding the action to the animation directly

        let animation = basicAnchorPointDescriptor.animation as! CABasicAnimation
        let expectation2: XCTestExpectation = self.expectation(description: "Animation did begin 2")
        let expectation3: XCTestExpectation = self.expectation(description: "Animation did begin 2")

        animation.addAnimationDidBeginAction {
            expectation2.fulfill()
        }

        animation.addAnimationDidBeginAction {
            expectation3.fulfill()
        }

        self.layer.addAnimation(animation)

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })
    }

    func testRemoveAnimationDidBeginMultipleActions() {

        let duration: TimeInterval = 4
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: duration)

        let expectation1: XCTestExpectation = self.expectation(description: "Animation did begin 1")
        let expectation2: XCTestExpectation = self.expectation(description: "Animation did begin 2")

        let animation = basicAnchorPointDescriptor.animation as! CABasicAnimation

        let id1 = animation.addAnimationDidBeginAction {
            XCTFail("Shouldn't be called")
            expectation1.fulfill()
            expectation2.fulfill()
        }

        animation.addAnimationDidBeginAction {
            expectation1.fulfill()
            expectation2.fulfill()
        }

        animation.removeAnimationAction(withID: id1)

        self.layer.addAnimation(animation)

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })
    }

    func testRemoveAllAnimationDidBeginActions() {

        let duration: TimeInterval = 0.5
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: duration)

        let expectation1: XCTestExpectation = self.expectation(description: "Animation did begin 1")
        let expectation2: XCTestExpectation = self.expectation(description: "Animation did begin 2")

        let animation = basicAnchorPointDescriptor.animation as! CABasicAnimation

        animation.addAnimationDidBeginAction {
            XCTFail("Shouldn't be called")
        }

        animation.addAnimationDidBeginAction {
            XCTFail("Shouldn't be called")
        }

        animation.removeAllAnimationDidBeginActions()

        self.layer.addAnimation(animation)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            expectation1.fulfill()
            expectation2.fulfill()
        }

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })
    }

    func testRemoveAllAnimationActions() {

        let duration: TimeInterval = 0.5
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: duration)

        let expectation1: XCTestExpectation = self.expectation(description: "Animation did begin 1")
        let expectation2: XCTestExpectation = self.expectation(description: "Animation did begin 2")

        let animation = basicAnchorPointDescriptor.animation as! CABasicAnimation

        animation.addAnimationDidBeginAction {
            XCTFail("Shouldn't be called")
        }

        animation.addAnimationDidFinishAction { _, _ in
            XCTFail("Shouldn't be called")
        }

        animation.removeAllActions()

        self.layer.addAnimation(animation)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            expectation1.fulfill()
            expectation2.fulfill()
        }

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })
    }

    func testAnimationWillBeginAction() {

        let duration: TimeInterval = 0.5
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: duration)

        let expectation: XCTestExpectation = self.expectation(description: "Animation will begin")

        basicAnchorPointDescriptor.animationWillBegin = {
            expectation.fulfill()
        }

        self.layer.addAnimation(describedBy: basicAnchorPointDescriptor)

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })
    }
}
