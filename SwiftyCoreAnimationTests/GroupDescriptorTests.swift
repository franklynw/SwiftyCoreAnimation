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

        let duration: TimeInterval = 2
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>()
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFrameColorsDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.path(path, duration: 4)

        let groupDescriptor = Descriptor.Group.Concurrent(using: [basicAnchorPointDescriptor, keyFrameColorsDescriptor], duration: duration)

        do {

            try self.shapeLayer.addAnimationsGroup(describedBy: groupDescriptor, forKey: "animation")
            let animation = self.shapeLayer.animation(forKey: "animation")!

            // the animation group's duration should override that of the individual group items
            XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")

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

    func testSequentialAnimationGroup() {

        let duration1: TimeInterval = 2
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: duration1)

        let duration2: TimeInterval = 4
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFrameColorsDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.path(path, duration: duration2)

        let groupDescriptor = Descriptor.Group.Sequential(using: [basicAnchorPointDescriptor, keyFrameColorsDescriptor])

        do {

            try self.shapeLayer.addAnimationsGroup(describedBy: groupDescriptor, forKey: "animation")
            let animation = self.shapeLayer.animation(forKey: "animation")!

            // the animation's duration should actually be the duration of the first item
            // (the way the sequences are created, only the first animation is returned)
            XCTAssertEqual(duration1, animation.duration, "Duration should be \(duration1)")

            // on the other hand, the duration of the descriptor should be the total
            XCTAssertEqual(duration1 + duration2, groupDescriptor.duration, "Duration should be \(duration1 + duration2)")

        } catch {
            XCTFail("Descriptor should have successfully created animation")
        }
    }
}
