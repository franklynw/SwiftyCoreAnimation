//
//  SpringDescriptorTests.swift
//  SwiftyCoreAnimationTests
//
//  Created by Franklyn on 05/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import XCTest
@testable import SwiftyCoreAnimation


class SpringDescriptorTests: XCTestCase {

    // Test all the spring animation descriptor constructors
    // Probably a fair assumption that if we can construct the descriptors for one property, it'll be ok for all of them

    private lazy var layer: CALayer = {
        return CALayer()
    }()


    func testSpringAnimation() {

        let duration: TimeInterval = 2
        let springSublayersDescriptor = SwiftyCoreAnimation.Descriptor.Spring<SwiftyCoreAnimation.Sublayers>(duration: duration)
        let animation = self.layer.addSpringAnimation(describedBy: springSublayersDescriptor)

        XCTAssertNil(animation.fromValue, "From value should be nil")
        XCTAssertNil(animation.byValue, "By value should be nil")
        XCTAssertNil(animation.toValue, "To value should be nil")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, SwiftyCoreAnimation.Sublayers.keyPath, "KeyPath should be \(SwiftyCoreAnimation.Sublayers.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }

    func testSpringAnimationFrom() {

        let start: [CALayer] = [CALayer(), CAShapeLayer()]
        let duration: TimeInterval = 2
        let springSublayersFromDescriptor = SwiftyCoreAnimation.Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.from(start, duration: duration)
        let animation = self.layer.addSpringAnimation(describedBy: springSublayersFromDescriptor)

        let fromValue: [CALayer] = animation.fromValue as! [CALayer]
        XCTAssertEqual(fromValue, start, "From value should be \(start)")

        XCTAssertNil(animation.byValue, "By value should be nil")
        XCTAssertNil(animation.toValue, "To value should be nil")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, SwiftyCoreAnimation.Sublayers.keyPath, "KeyPath should be \(SwiftyCoreAnimation.Sublayers.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }

    func testSpringAnimationBy() {

        let by: [CALayer] = [CALayer(), CAShapeLayer()]
        let duration: TimeInterval = 2
        let springSublayersByDescriptor = SwiftyCoreAnimation.Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.by(by, duration: duration)
        let animation = self.layer.addSpringAnimation(describedBy: springSublayersByDescriptor)

        XCTAssertNil(animation.fromValue, "From value should be nil")

        let byValue: [CALayer] = animation.byValue as! [CALayer]
        XCTAssertEqual(byValue, by, "From value should be \(by)")

        XCTAssertNil(animation.toValue, "To value should be nil")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, SwiftyCoreAnimation.Sublayers.keyPath, "KeyPath should be \(SwiftyCoreAnimation.Sublayers.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }

    func testSpringAnimationTo() {

        let finish: [CALayer] = [CALayer(), CAShapeLayer()]
        let duration: TimeInterval = 2
        let springSublayersToDescriptor = SwiftyCoreAnimation.Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.to(finish, duration: duration)
        let animation = self.layer.addSpringAnimation(describedBy: springSublayersToDescriptor)

        XCTAssertNil(animation.fromValue, "From value should be nil")
        XCTAssertNil(animation.byValue, "By value should be nil")

        let toValue: [CALayer] = animation.toValue as! [CALayer]
        XCTAssertEqual(toValue, finish, "To value should be \(finish)")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, SwiftyCoreAnimation.Sublayers.keyPath, "KeyPath should be \(SwiftyCoreAnimation.Sublayers.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }

    func testSpringAnimationFromTo() {

        let start: [CALayer] = [CALayer(), CAShapeLayer()]
        let finish: [CALayer] = [CALayer(), CAShapeLayer(), CAGradientLayer()]
        let duration: TimeInterval = 2
        let springSublayersFromToDescriptor = SwiftyCoreAnimation.Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.from(start, to: finish, duration: duration)

        let animation = self.layer.addSpringAnimation(describedBy: springSublayersFromToDescriptor)

        let fromValue: [CALayer] = animation.fromValue as! [CALayer]
        XCTAssertEqual(fromValue, start, "From value should be \(start)")

        XCTAssertNil(animation.byValue, "By value should be nil")

        let toValue: [CALayer] = animation.toValue as! [CALayer]
        XCTAssertEqual(toValue, finish, "To value should be \(finish)")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, SwiftyCoreAnimation.Sublayers.keyPath, "KeyPath should be \(SwiftyCoreAnimation.Sublayers.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }

    func testSpringAnimationFromBy() {

        let start: [CALayer] = [CALayer(), CAShapeLayer()]
        let by: [CALayer] = [CALayer(), CAShapeLayer(), CAGradientLayer()]
        let duration: TimeInterval = 2

        let timingProperties: [SwiftyCoreAnimation.PropertiesApplicableToSpringAnimations] = [SwiftyCoreAnimation.Properties.MediaTiming.fillMode(.backwards), SwiftyCoreAnimation.Properties.isRemovedOnCompletion(false)]
        let springSublayersFromByDescriptor = SwiftyCoreAnimation.Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.from(start, by: by, duration: duration, otherAnimationProperties: timingProperties)
        let animation = self.layer.addSpringAnimation(describedBy: springSublayersFromByDescriptor)

        let fromValue: [CALayer] = animation.fromValue as! [CALayer]
        XCTAssertEqual(fromValue, start, "From value should be \(start)")

        let byValue: [CALayer] = animation.byValue as! [CALayer]
        XCTAssertEqual(byValue, by, "By value should be \(by)")

        XCTAssertNil(animation.toValue, "To value should be nil")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, SwiftyCoreAnimation.Sublayers.keyPath, "KeyPath should be \(SwiftyCoreAnimation.Sublayers.keyPath)")
        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
        XCTAssertEqual(CAMediaTimingFillMode.backwards, animation.fillMode, "FillMode should be .backwards")
        XCTAssertFalse(animation.isRemovedOnCompletion, "isRemovedOnCompletion should be false")
    }

    func testSpringAnimationByTo() {

        let start: [CALayer] = [CALayer(), CAShapeLayer()]
        let finish: [CALayer] = [CALayer(), CAShapeLayer(), CAGradientLayer()]
        let duration: TimeInterval = 2
        let springSublayersByToDescriptor = SwiftyCoreAnimation.Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.by(start, to: finish, duration: duration)
        let animation = self.layer.addSpringAnimation(describedBy: springSublayersByToDescriptor)

        XCTAssertNil(animation.fromValue, "From value should be nil")

        let byValue: [CALayer] = animation.byValue as! [CALayer]
        XCTAssertEqual(byValue, start, "By value should be \(start)")

        let toValue: [CALayer] = animation.toValue as! [CALayer]
        XCTAssertEqual(toValue, finish, "To value should be \(finish)")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, SwiftyCoreAnimation.Sublayers.keyPath, "KeyPath should be \(SwiftyCoreAnimation.Sublayers.keyPath)")
        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }
}
