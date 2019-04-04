//
//  AnimationFinishedActionsTests.swift
//  SwiftyCoreAnimationTests
//
//  Created by Franklyn on 07/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import XCTest
@testable import SwiftyCoreAnimation


class AnimationFinishedActionsTests: XCTestCase {

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

        animation.addAnimationFinishedAction { _, _ in
            expectation1.fulfill()
        }

        animation.addAnimationFinishedAction { _, _ in
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

        let id1 = animation.addAnimationFinishedAction { _, _ in
            XCTFail("Shouldn't be called")
            expectation1.fulfill()
            expectation2.fulfill()
        }

        animation.addAnimationFinishedAction { _, _ in
            expectation1.fulfill()
            expectation2.fulfill()
        }

        animation.removeAnimationFinishedAction(withID: id1)

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

        animation.addAnimationFinishedAction { _, _ in
            XCTFail("Shouldn't be called")
        }

        animation.addAnimationFinishedAction { _, _ in
            XCTFail("Shouldn't be called")
        }

        animation.removeAllAnimationFinishedActions()

        self.layer.addAnimation(animation)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            expectation1.fulfill()
            expectation2.fulfill()
        }

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })
    }
}
