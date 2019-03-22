//
//  TransitionDescriptorTests.swift
//  SwiftyCoreAnimationTests
//
//  Created by Franklyn on 06/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import XCTest
@testable import SwiftyCoreAnimation


class TransitionDescriptorTests: XCTestCase {

    // Test all the transition descriptor constructors
    // Probably a fair assumption that if we can construct the descriptors for one property, it'll be ok for all of them

    private lazy var layer: CALayer = {
        return CALayer()
    }()


    func testTransition() {

        let duration: TimeInterval = 2
        let start: CGFloat = 0
        let end: CGFloat = 1
        let transitionDescriptor = SwiftyCoreAnimation.Descriptor.Transition(type: .moveIn, subtype: .fromLeft, startProgress: start, endProgress: end, duration: 2)
        self.layer.addTransition(describedBy: transitionDescriptor)
        let animation = self.layer.animation(forKey: "transition") as! CATransition

        XCTAssertEqual(animation.type, CATransitionType.moveIn, "Should be equal")
        XCTAssertEqual(animation.subtype, CATransitionSubtype.fromLeft, "Should be equal")
        XCTAssertEqual(animation.startProgress, Float(start), "Should be equal")
        XCTAssertEqual(animation.endProgress, Float(end), "Should be equal")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }
}
