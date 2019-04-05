//
//  GroupDescriptorTests.swift
//  SwiftyCoreAnimationTests
//
//  Created by Franklyn on 15/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import XCTest
@testable import SwiftyCoreAnimation


class GroupDescriptorTests: XCTestCase {

    // Test all the group animation descriptor constructors
    // Probably a fair assumption that if we can construct the descriptors for one property, it'll be ok for all of them

    // Unfortunately, there's a fair chunk of the Group Descriptor code which is pretty much untestable here,
    // we'd have to write UI tests - mark that as a TODO...

    private lazy var layer: CALayer = {
        return CALayer()
    }()
    private lazy var shapeLayer: CAShapeLayer = {
        return CAShapeLayer()
    }()


    func testConcurrentAnimationGroup() {

        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2, key: "anchorPoint")
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFrameColorsDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.path(path, duration: 4, key: "colors")

        let groupDescriptor = Descriptor.Group.Concurrent(using: [basicAnchorPointDescriptor, keyFrameColorsDescriptor])

        do {

            try self.shapeLayer.addAnimationsGroup(describedBy: groupDescriptor)
            let animation = self.shapeLayer.animation(forKey: "anchorPoint")!

            XCTAssertEqual(2, animation.duration, "Animation duration should be 2")

            // the animation group's duration should be the same as the longest animation's
            XCTAssertEqual(4, groupDescriptor.duration, "Duration should be 4")

        } catch {
            XCTFail("Descriptor should have successfully created animation")
        }


        // this next attempt should throw, as we can't animate FillColor on a CALayer

        do {

            _ = try self.layer.addAnimationsGroup(describedBy: groupDescriptor)

            XCTFail("Descriptor should have failed to create animation using CAShapeLayer properties on a CALayer")

        } catch {
            // success
            XCTAssertNotNil(error.localizedDescription, "Should have error description")
        }
    }

    func testConcurrentAnimationGroupOfGroups() {

        // tests a concurrent group of concurrents

        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2, key: "anchorPoint")
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFrameColorsDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.path(path, duration: 4, key: "colors")
        let start: [CALayer] = [CALayer(), CAShapeLayer()]
        let finish: [CALayer] = [CALayer(), CAShapeLayer(), CAGradientLayer()]
        let springSublayersFromToDescriptor = Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.from(start, to: finish, duration: 3, key: "sublayers")
        let opacityDescriptor = Descriptor.Basic<SwiftyCoreAnimation.Opacity>.from(0, to: 1, duration: 5, key: "opacity")

        let childGroupDescriptor1 = Descriptor.Group.Concurrent(using: [basicAnchorPointDescriptor, keyFrameColorsDescriptor])
        let childGroupDescriptor2 = Descriptor.Group.Concurrent(using: [springSublayersFromToDescriptor, opacityDescriptor])

        let parentGroupDescriptor = Descriptor.Group.Concurrent(using: [childGroupDescriptor1, childGroupDescriptor2])

        do {

            try self.shapeLayer.addAnimationsGroup(describedBy: parentGroupDescriptor)

            let animation1 = self.shapeLayer.animation(forKey: "anchorPoint")!
            XCTAssertEqual(2, animation1.duration, "AnchorPoint animation duration should be 2")

            let animation2 = self.shapeLayer.animation(forKey: "colors")!
            XCTAssertEqual(4, animation2.duration, "Colors animation duration should be 4")

            let animation3 = self.shapeLayer.animation(forKey: "sublayers")!
            XCTAssertEqual(3, animation3.duration, "Sublayers animation duration should be 3")

            let animation4 = self.shapeLayer.animation(forKey: "opacity")!
            XCTAssertEqual(5, animation4.duration, "Opacity animation duration should be 5")

            // the animation group's duration should be the same as the longest child animation group's
            XCTAssertEqual(5, parentGroupDescriptor.duration, "Duration should be 4")

        } catch {
            XCTFail("Descriptor should have successfully created animation")
        }


        // this next attempt should throw, as we can't animate FillColor on a CALayer

        do {

            _ = try self.layer.addAnimationsGroup(describedBy: parentGroupDescriptor)

            XCTFail("Descriptor should have failed to create animation using CAShapeLayer properties on a CALayer")

        } catch {
            // success
            XCTAssertNotNil(error.localizedDescription, "Should have error description")
        }
    }

    func testConcurrentAnimationGroupOfGroups2() {

        // tests a concurrent group of sequences

        let properties = [Properties.isRemovedOnCompletion(false)] // we need to keep the animations around as they are removed pretty much instantly without real UI
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2, otherAnimationProperties: properties, key: "anchorPoint")
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFrameColorsDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.path(path, duration: 4, otherAnimationProperties: properties, key: "colors")
        let start: [CALayer] = [CALayer(), CAShapeLayer()]
        let finish: [CALayer] = [CALayer(), CAShapeLayer(), CAGradientLayer()]
        let springSublayersFromToDescriptor = Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.from(start, to: finish, duration: 3, otherAnimationProperties: properties, key: "sublayers")
        let opacityDescriptor = Descriptor.Basic<SwiftyCoreAnimation.Opacity>.from(0, to: 1, duration: 5, otherAnimationProperties: properties, key: "opacity")

        let childGroupDescriptor1 = Descriptor.Group.Sequential(using: [basicAnchorPointDescriptor, keyFrameColorsDescriptor])
        let childGroupDescriptor2 = Descriptor.Group.Sequential(using: [springSublayersFromToDescriptor, opacityDescriptor])

        let parentGroupDescriptor = Descriptor.Group.Concurrent(using: [childGroupDescriptor1, childGroupDescriptor2])

        let expectation: XCTestExpectation = self.expectation(description: "Action finished")

        childGroupDescriptor2.animationDidFinish = { _, _ in
            expectation.fulfill()
        }

        do {
            try self.shapeLayer.addAnimationsGroup(describedBy: parentGroupDescriptor)
        } catch {
            XCTFail("Descriptor should have successfully created animation")
        }

        self.waitForExpectations(timeout: 6, handler: { error in
            XCTAssertNil(error, "Timed out")
        })

        let animation1 = self.shapeLayer.animation(forKey: "anchorPoint")!
        XCTAssertEqual(2, animation1.duration, "AnchorPoint animation duration should be 2")

        let animation2 = self.shapeLayer.animation(forKey: "colors")!
        XCTAssertEqual(4, animation2.duration, "Colors animation duration should be 4")

        let animation3 = self.shapeLayer.animation(forKey: "sublayers")!
        XCTAssertEqual(3, animation3.duration, "Sublayers animation duration should be 3")

        let animation4 = self.shapeLayer.animation(forKey: "opacity")!
        XCTAssertEqual(5, animation4.duration, "Opacity animation duration should be 5")

        // the animation group's duration should be the same as the longest child animation sequence
        XCTAssertEqual(8, parentGroupDescriptor.duration, "Duration should be 8")


        // this next attempt should throw, as we can't animate FillColor on a CALayer

        do {

            _ = try self.layer.addAnimationsGroup(describedBy: parentGroupDescriptor)

            XCTFail("Descriptor should have failed to create animation using CAShapeLayer properties on a CALayer")

        } catch {
            // success
            XCTAssertNotNil(error.localizedDescription, "Should have error description")
        }
    }

    func testConcurrentAnimationGroupOfGroups3() {

        // tests a concurrent group of sequences & concurrents

        let properties = [Properties.isRemovedOnCompletion(false)] // we need to keep the animations around as they are removed pretty much instantly without real UI
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2, otherAnimationProperties: properties, key: "anchorPoint")
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFrameColorsDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.path(path, duration: 4, otherAnimationProperties: properties, key: "colors")
        let start: [CALayer] = [CALayer(), CAShapeLayer()]
        let finish: [CALayer] = [CALayer(), CAShapeLayer(), CAGradientLayer()]
        let springSublayersFromToDescriptor = Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.from(start, to: finish, duration: 3, otherAnimationProperties: properties, key: "sublayers")
        let opacityDescriptor = Descriptor.Basic<SwiftyCoreAnimation.Opacity>.from(0, to: 1, duration: 5, otherAnimationProperties: properties, key: "opacity")

        let childGroupDescriptor1 = Descriptor.Group.Sequential(using: [basicAnchorPointDescriptor, keyFrameColorsDescriptor])
        let childGroupDescriptor2 = Descriptor.Group.Concurrent(using: [springSublayersFromToDescriptor, opacityDescriptor])

        let parentGroupDescriptor = Descriptor.Group.Concurrent(using: [childGroupDescriptor1, childGroupDescriptor2])

        let expectation: XCTestExpectation = self.expectation(description: "Action finished")

        childGroupDescriptor2.animationDidFinish = { _, _ in
            expectation.fulfill()
        }

        do {
            try self.shapeLayer.addAnimationsGroup(describedBy: parentGroupDescriptor)
        } catch {
            XCTFail("Descriptor should have successfully created animation")
        }

        self.waitForExpectations(timeout: 6, handler: { error in
            XCTAssertNil(error, "Timed out")
        })

        let animation1 = self.shapeLayer.animation(forKey: "anchorPoint")!
        XCTAssertEqual(2, animation1.duration, "AnchorPoint animation duration should be 2")

        let animation2 = self.shapeLayer.animation(forKey: "colors")!
        XCTAssertEqual(4, animation2.duration, "Colors animation duration should be 4")

        let animation3 = self.shapeLayer.animation(forKey: "sublayers")!
        XCTAssertEqual(3, animation3.duration, "Sublayers animation duration should be 3")

        let animation4 = self.shapeLayer.animation(forKey: "opacity")!
        XCTAssertEqual(5, animation4.duration, "Opacity animation duration should be 5")

        // the animation group's duration should be the same as the longest child animation sequence
        XCTAssertEqual(6, parentGroupDescriptor.duration, "Duration should be 6")


        // this next attempt should throw, as we can't animate FillColor on a CALayer

        do {

            _ = try self.layer.addAnimationsGroup(describedBy: parentGroupDescriptor)

            XCTFail("Descriptor should have failed to create animation using CAShapeLayer properties on a CALayer")

        } catch {
            // success
            XCTAssertNotNil(error.localizedDescription, "Should have error description")
        }
    }

    func testConcurrentAnimationGroupWithActions() {

        var testInt1 = 0
        var testInt2 = 0

        let actionDescriptor = Descriptor.Action {
            testInt1 = 5
        }
        let actionDescriptor2 = Descriptor.Action {
            testInt2 = 7
        }
        let properties = [Properties.isRemovedOnCompletion(false)] // we need to keep the animations around as they are removed pretty much instantly without real UI
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2, otherAnimationProperties: properties, key: "anchorPoint")
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFrameColorsDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.path(path, duration: 4, otherAnimationProperties: properties, key: "colors")

        let groupDescriptor = Descriptor.Group.Concurrent(using: [actionDescriptor, basicAnchorPointDescriptor, actionDescriptor2, keyFrameColorsDescriptor])

        let expectation: XCTestExpectation = self.expectation(description: "Action finished")

        groupDescriptor.animationDidFinish = { _, _ in
            expectation.fulfill()
        }

        do {
            try self.shapeLayer.addAnimationsGroup(describedBy: groupDescriptor)
        } catch {
            XCTFail("Descriptor should have successfully created animation")
        }

        self.waitForExpectations(timeout: 6, handler: { error in
            XCTAssertNil(error, "Timed out")
        })


        let animation = self.shapeLayer.animation(forKey: "anchorPoint")!

        XCTAssertEqual(2, animation.duration, "Animation duration should be 2")

        // the animation group's duration should be the same as the longest animation's
        XCTAssertEqual(4, groupDescriptor.duration, "Duration should be 4")

        XCTAssertEqual(testInt1, 5, "testInt1 should have been set to 5")
        XCTAssertEqual(testInt2, 7, "testInt2 should have been set to 7")
        

        // this next attempt should throw, as we can't animate FillColor on a CALayer

        do {

            _ = try self.layer.addAnimationsGroup(describedBy: groupDescriptor)

            XCTFail("Descriptor should have failed to create animation using CAShapeLayer properties on a CALayer")

        } catch {
            // success
            XCTAssertNotNil(error.localizedDescription, "Should have error description")
        }
    }

    func testSequentialAnimationGroup() {

        let duration1: TimeInterval = 2
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: duration1, key: "anchorPoint")

        let duration2: TimeInterval = 4
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFrameColorsDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.path(path, duration: duration2, key: "colors")

        let groupDescriptor = Descriptor.Group.Sequential(using: [basicAnchorPointDescriptor, keyFrameColorsDescriptor])

        do {

            try self.shapeLayer.addAnimationsGroup(describedBy: groupDescriptor)
            let animation = self.shapeLayer.animation(forKey: "anchorPoint")!

            // the animation's duration should actually be the duration of the first item
            // (the way the sequences are created, only the first animation is returned)
            XCTAssertEqual(duration1, animation.duration, "Duration should be \(duration1)")

            // on the other hand, the duration of the descriptor should be the total
            XCTAssertEqual(duration1 + duration2, groupDescriptor.duration, "Duration should be \(duration1 + duration2)")

        } catch {
            XCTFail("Descriptor should have successfully created animation")
        }
    }

    func testSequentialAnimationGroupOfGroups() {

        // tests a sequence of concurrents

        let properties = [Properties.isRemovedOnCompletion(false)] // we need to keep the animations around as they are removed pretty much instantly without real UI
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2, otherAnimationProperties: properties, key: "anchorPoint")
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFrameColorsDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.path(path, duration: 4, otherAnimationProperties: properties, key: "colors")
        let start: [CALayer] = [CALayer(), CAShapeLayer()]
        let finish: [CALayer] = [CALayer(), CAShapeLayer(), CAGradientLayer()]
        let springSublayersFromToDescriptor = Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.from(start, to: finish, duration: 3, otherAnimationProperties: properties, key: "sublayers")
        let opacityDescriptor = Descriptor.Basic<SwiftyCoreAnimation.Opacity>.from(0, to: 1, duration: 5, otherAnimationProperties: properties, key: "opacity")

        let childGroupDescriptor1 = Descriptor.Group.Concurrent(using: [basicAnchorPointDescriptor, keyFrameColorsDescriptor])
        let childGroupDescriptor2 = Descriptor.Group.Concurrent(using: [springSublayersFromToDescriptor, opacityDescriptor])

        let parentGroupDescriptor = Descriptor.Group.Sequential(using: [childGroupDescriptor1, childGroupDescriptor2])

        let expectation: XCTestExpectation = self.expectation(description: "Action finished")

        childGroupDescriptor2.animationDidFinish = { _, _ in
            expectation.fulfill()
        }

        do {
            try self.shapeLayer.addAnimationsGroup(describedBy: parentGroupDescriptor)
        } catch {
            XCTFail("Descriptor should have successfully created animation")
        }

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })

        // we can test after the sequence has ended

        let animation1 = self.shapeLayer.animation(forKey: "anchorPoint")!
        XCTAssertEqual(2, animation1.duration, "AnchorPoint animation duration should be 2")

        let animation2 = self.shapeLayer.animation(forKey: "colors")!
        XCTAssertEqual(4, animation2.duration, "Colors animation duration should be 4")

        let animation3 = self.shapeLayer.animation(forKey: "sublayers")!
        XCTAssertEqual(3, animation3.duration, "Sublayers animation duration should be 3")

        let animation4 = self.shapeLayer.animation(forKey: "opacity")!
        XCTAssertEqual(5, animation4.duration, "Opacity animation duration should be 5")

        // on the other hand, the duration of the descriptor should be the total
        XCTAssertEqual(9, parentGroupDescriptor.duration, "Sequence duration should be 9")
    }

    func testSequentialAnimationGroupOfGroups2() {

        // tests a sequence of sequences

        let properties = [Properties.isRemovedOnCompletion(false)] // we need to keep the animations around as they are removed pretty much instantly without real UI
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2, otherAnimationProperties: properties, key: "anchorPoint")
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFrameColorsDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.path(path, duration: 4, otherAnimationProperties: properties, key: "colors")
        let start: [CALayer] = [CALayer(), CAShapeLayer()]
        let finish: [CALayer] = [CALayer(), CAShapeLayer(), CAGradientLayer()]
        let springSublayersFromToDescriptor = Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.from(start, to: finish, duration: 3, otherAnimationProperties: properties, key: "sublayers")
        let opacityDescriptor = Descriptor.Basic<SwiftyCoreAnimation.Opacity>.from(0, to: 1, duration: 5, otherAnimationProperties: properties, key: "opacity")

        let childGroupDescriptor1 = Descriptor.Group.Sequential(using: [basicAnchorPointDescriptor, keyFrameColorsDescriptor])
        let childGroupDescriptor2 = Descriptor.Group.Sequential(using: [springSublayersFromToDescriptor, opacityDescriptor])

        let parentGroupDescriptor = Descriptor.Group.Sequential(using: [childGroupDescriptor1, childGroupDescriptor2])

        let expectation: XCTestExpectation = self.expectation(description: "Action finished")

        childGroupDescriptor2.animationDidFinish = { _, _ in
            expectation.fulfill()
        }

        do {
            try self.shapeLayer.addAnimationsGroup(describedBy: parentGroupDescriptor)
        } catch {
            XCTFail("Descriptor should have successfully created animation")
        }

        self.waitForExpectations(timeout: 6, handler: { error in
            XCTAssertNil(error, "Timed out")
        })

        // we can test after the sequence has ended

        let animation1 = self.shapeLayer.animation(forKey: "anchorPoint")!
        XCTAssertEqual(2, animation1.duration, "AnchorPoint animation duration should be 2")

        let animation2 = self.shapeLayer.animation(forKey: "colors")!
        XCTAssertEqual(4, animation2.duration, "Colors animation duration should be 4")

        let animation3 = self.shapeLayer.animation(forKey: "sublayers")
        XCTAssertEqual(3, animation3?.duration, "Sublayers animation duration should be 3")

        let animation4 = self.shapeLayer.animation(forKey: "opacity")
        XCTAssertEqual(5, animation4?.duration, "Opacity animation duration should be 5")

        // on the other hand, the duration of the descriptor should be the total
        XCTAssertEqual(14, parentGroupDescriptor.duration, "Sequence duration should be 14")
    }

    func testSequentialAnimationGroupOfGroups3() {

        // tests a sequence of sequences & concurrents

        let properties = [Properties.isRemovedOnCompletion(false)] // we need to keep the animations around as they are removed pretty much instantly without real UI
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2, otherAnimationProperties: properties, key: "anchorPoint")
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFrameColorsDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.path(path, duration: 4, otherAnimationProperties: properties, key: "colors")
        let start: [CALayer] = [CALayer(), CAShapeLayer()]
        let finish: [CALayer] = [CALayer(), CAShapeLayer(), CAGradientLayer()]
        let springSublayersFromToDescriptor = Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.from(start, to: finish, duration: 3, otherAnimationProperties: properties, key: "sublayers")
        let opacityDescriptor = Descriptor.Basic<SwiftyCoreAnimation.Opacity>.from(0, to: 1, duration: 5, otherAnimationProperties: properties, key: "opacity")

        let childGroupDescriptor1 = Descriptor.Group.Sequential(using: [basicAnchorPointDescriptor, keyFrameColorsDescriptor])
        let childGroupDescriptor2 = Descriptor.Group.Concurrent(using: [springSublayersFromToDescriptor, opacityDescriptor])

        let parentGroupDescriptor = Descriptor.Group.Sequential(using: [childGroupDescriptor1, childGroupDescriptor2])

        let expectation: XCTestExpectation = self.expectation(description: "Action finished")

        childGroupDescriptor2.animationDidFinish = { _, _ in
            expectation.fulfill()
        }

        do {
            try self.shapeLayer.addAnimationsGroup(describedBy: parentGroupDescriptor)
        } catch {
            XCTFail("Descriptor should have successfully created animation")
        }

        self.waitForExpectations(timeout: 6, handler: { error in
            XCTAssertNil(error, "Timed out")
        })

        // we can test after the sequence has ended

        let animation1 = self.shapeLayer.animation(forKey: "anchorPoint")!
        XCTAssertEqual(2, animation1.duration, "AnchorPoint animation duration should be 2")

        let animation2 = self.shapeLayer.animation(forKey: "colors")!
        XCTAssertEqual(4, animation2.duration, "Colors animation duration should be 4")

        let animation3 = self.shapeLayer.animation(forKey: "sublayers")
        XCTAssertEqual(3, animation3?.duration, "Sublayers animation duration should be 3")

        let animation4 = self.shapeLayer.animation(forKey: "opacity")
        XCTAssertEqual(5, animation4?.duration, "Opacity animation duration should be 5")

        // on the other hand, the duration of the descriptor should be the total
        XCTAssertEqual(11, parentGroupDescriptor.duration, "Sequence duration should be 11")
    }

    func testSequentialAnimationGroupWithActions() {

        var testInt1 = 0
        var testInt2 = 0

        let actionDescriptor = Descriptor.Action {
            testInt1 = 5
        }
        let actionDescriptor2 = Descriptor.Action {
            testInt2 = 7
        }
        let duration1: TimeInterval = 2
        let properties = [Properties.isRemovedOnCompletion(false)] // we need to keep the animations around as they are removed pretty much instantly without real UI
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: duration1, otherAnimationProperties: properties, key: "anchorPoint")

        let duration2: TimeInterval = 4
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFrameColorsDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.path(path, duration: duration2, otherAnimationProperties: properties, key: "colors")

        let groupDescriptor = Descriptor.Group.Sequential(using: [actionDescriptor, basicAnchorPointDescriptor, actionDescriptor2, keyFrameColorsDescriptor])

        let expectation: XCTestExpectation = self.expectation(description: "Action finished")

        groupDescriptor.animationDidFinish = { _, _ in
            expectation.fulfill()
        }

        do {
            try self.shapeLayer.addAnimationsGroup(describedBy: groupDescriptor)
        } catch {
            XCTFail("Descriptor should have successfully created animation")
        }

        self.waitForExpectations(timeout: 6, handler: { error in
            XCTAssertNil(error, "Timed out")
        })


        let animation = self.shapeLayer.animation(forKey: "anchorPoint")!

        // the animation's duration should actually be the duration of the first item
        // (the way the sequences are created, only the first animation is returned)
        XCTAssertEqual(duration1, animation.duration, "Duration should be \(duration1)")

        // on the other hand, the duration of the descriptor should be the total
        XCTAssertEqual(duration1 + duration2, groupDescriptor.duration, "Duration should be \(duration1 + duration2)")

        XCTAssertEqual(testInt1, 5, "testInt1 should have been set to 5")
        XCTAssertEqual(testInt2, 7, "testInt2 should have been set to 7")
    }
}
