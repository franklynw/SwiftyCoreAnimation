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
        let springSublayersDescriptor = Descriptor.Spring<SwiftyCoreAnimation.Sublayers>(duration: duration)
        self.layer.addSpringAnimation(describedBy: springSublayersDescriptor, forKey: "animation")
        let animation = self.layer.animation(forKey: "animation") as! CASpringAnimation

        XCTAssertNil(animation.fromValue, "From value should be nil")
        XCTAssertNil(animation.byValue, "By value should be nil")
        XCTAssertNil(animation.toValue, "To value should be nil")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, Sublayers.keyPath, "KeyPath should be \(Sublayers.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }

    func testSpringAnimationFrom() {

        let start: [CALayer] = [CALayer(), CAShapeLayer()]
        let duration: TimeInterval = 2
        let springSublayersFromDescriptor = Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.from(start, duration: duration)
        self.layer.addSpringAnimation(describedBy: springSublayersFromDescriptor, forKey: "animation")
        let animation = self.layer.animation(forKey: "animation") as! CASpringAnimation

        let fromValue: [CALayer] = animation.fromValue as! [CALayer]
        XCTAssertEqual(fromValue, start, "From value should be \(start)")

        XCTAssertNil(animation.byValue, "By value should be nil")
        XCTAssertNil(animation.toValue, "To value should be nil")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, Sublayers.keyPath, "KeyPath should be \(Sublayers.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }

    func testSpringAnimationBy() {

        let by: [CALayer] = [CALayer(), CAShapeLayer()]
        let duration: TimeInterval = 2
        let springSublayersByDescriptor = Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.by(by, duration: duration)
        self.layer.addSpringAnimation(describedBy: springSublayersByDescriptor, forKey: "animation")
        let animation = self.layer.animation(forKey: "animation") as! CASpringAnimation

        XCTAssertNil(animation.fromValue, "From value should be nil")

        let byValue: [CALayer] = animation.byValue as! [CALayer]
        XCTAssertEqual(byValue, by, "From value should be \(by)")

        XCTAssertNil(animation.toValue, "To value should be nil")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, Sublayers.keyPath, "KeyPath should be \(Sublayers.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }

    func testSpringAnimationTo() {

        let finish: [CALayer] = [CALayer(), CAShapeLayer()]
        let duration: TimeInterval = 2
        let springSublayersToDescriptor = Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.to(finish, duration: duration)
        self.layer.addSpringAnimation(describedBy: springSublayersToDescriptor, forKey: "animation")
        let animation = self.layer.animation(forKey: "animation") as! CASpringAnimation

        XCTAssertNil(animation.fromValue, "From value should be nil")
        XCTAssertNil(animation.byValue, "By value should be nil")

        let toValue: [CALayer] = animation.toValue as! [CALayer]
        XCTAssertEqual(toValue, finish, "To value should be \(finish)")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, Sublayers.keyPath, "KeyPath should be \(Sublayers.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }

    func testSpringAnimationFromTo() {

        let start: [CALayer] = [CALayer(), CAShapeLayer()]
        let finish: [CALayer] = [CALayer(), CAShapeLayer(), CAGradientLayer()]
        let duration: TimeInterval = 2
        let springSublayersFromToDescriptor = Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.from(start, to: finish, duration: duration)

        self.layer.addSpringAnimation(describedBy: springSublayersFromToDescriptor, forKey: "animation")
        let animation = self.layer.animation(forKey: "animation") as! CASpringAnimation

        let fromValue: [CALayer] = animation.fromValue as! [CALayer]
        XCTAssertEqual(fromValue, start, "From value should be \(start)")

        XCTAssertNil(animation.byValue, "By value should be nil")

        let toValue: [CALayer] = animation.toValue as! [CALayer]
        XCTAssertEqual(toValue, finish, "To value should be \(finish)")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, Sublayers.keyPath, "KeyPath should be \(Sublayers.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }

    func testSpringAnimationFromBy() {

        let start: [CALayer] = [CALayer(), CAShapeLayer()]
        let by: [CALayer] = [CALayer(), CAShapeLayer(), CAGradientLayer()]
        let duration: TimeInterval = 2

        let timingProperties: [SwiftyCoreAnimation.PropertiesApplicableToSpringAnimations] = [SwiftyCoreAnimation.Properties.MediaTiming.fillMode(.backwards), Properties.isRemovedOnCompletion(false)]
        let springSublayersFromByDescriptor = Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.from(start, by: by, duration: duration, otherAnimationProperties: timingProperties)
        self.layer.addSpringAnimation(describedBy: springSublayersFromByDescriptor, forKey: "animation")
        let animation = self.layer.animation(forKey: "animation") as! CASpringAnimation

        let fromValue: [CALayer] = animation.fromValue as! [CALayer]
        XCTAssertEqual(fromValue, start, "From value should be \(start)")

        let byValue: [CALayer] = animation.byValue as! [CALayer]
        XCTAssertEqual(byValue, by, "By value should be \(by)")

        XCTAssertNil(animation.toValue, "To value should be nil")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, Sublayers.keyPath, "KeyPath should be \(Sublayers.keyPath)")
        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
        XCTAssertEqual(CAMediaTimingFillMode.backwards, animation.fillMode, "FillMode should be .backwards")
        XCTAssertFalse(animation.isRemovedOnCompletion, "isRemovedOnCompletion should be false")
    }

    func testSpringAnimationByTo() {

        let start: [CALayer] = [CALayer(), CAShapeLayer()]
        let finish: [CALayer] = [CALayer(), CAShapeLayer(), CAGradientLayer()]
        let duration: TimeInterval = 2
        let springSublayersByToDescriptor = Descriptor.Spring<SwiftyCoreAnimation.Sublayers>.by(start, to: finish, duration: duration)
        self.layer.addSpringAnimation(describedBy: springSublayersByToDescriptor, forKey: "animation")
        let animation = self.layer.animation(forKey: "animation") as! CASpringAnimation

        XCTAssertNil(animation.fromValue, "From value should be nil")

        let byValue: [CALayer] = animation.byValue as! [CALayer]
        XCTAssertEqual(byValue, start, "By value should be \(start)")

        let toValue: [CALayer] = animation.toValue as! [CALayer]
        XCTAssertEqual(toValue, finish, "To value should be \(finish)")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, Sublayers.keyPath, "KeyPath should be \(Sublayers.keyPath)")
        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }
}
