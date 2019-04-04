//
//  FWAnimationTests.swift
//  FWAnimationTests
//
//  Created by Franklyn on 22/02/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import XCTest
@testable import SwiftyCoreAnimation


class BasicAnimationDescriptorTests: XCTestCase {

    // Test all the basic animation descriptor constructors
    // Probably a fair assumption that if we can construct the descriptors for one property, it'll be ok for all of them

    private lazy var layer: CALayer = {
        return CALayer()
    }()


    func testBasicAnimation() {

        let duration: TimeInterval = 2
        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: duration)
        self.layer.addAnimation(describedBy: basicAnchorPointDescriptor, forKey: "animation")
        let animation = self.layer.animation(forKey: "animation") as! CABasicAnimation

        XCTAssertNil(animation.fromValue, "From value should be nil")
        XCTAssertNil(animation.byValue, "By value should be nil")
        XCTAssertNil(animation.toValue, "To value should be nil")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, AnchorPoint.X.keyPath, "KeyPath should be \(AnchorPoint.X.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }

    func testBasicAnimationFrom() {

        let start: CGFloat = 0
        let duration: TimeInterval = 2
        let basicAnchorPointFromDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.Z>.from(start, duration: duration)
        self.layer.addAnimation(describedBy: basicAnchorPointFromDescriptor, forKey: "animation")
        let animation = self.layer.animation(forKey: "animation") as! CABasicAnimation

        let fromValue: CGFloat = CGFloat((animation.fromValue as? NSNumber)!.doubleValue)
        XCTAssertEqual(fromValue, start, "From value should be \(start)")

        XCTAssertNil(animation.byValue, "By value should be nil")
        XCTAssertNil(animation.toValue, "To value should be nil")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, AnchorPoint.Z.keyPath, "KeyPath should be \(AnchorPoint.Z.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }

    func testBasicAnimationBy() {

        let by: CGFloat = 0
        let duration: TimeInterval = 2
        let basicAnchorPointByDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.Z>.by(by, duration: duration)
        self.layer.addAnimation(describedBy: basicAnchorPointByDescriptor, forKey: "animation")
        let animation = self.layer.animation(forKey: "animation") as! CABasicAnimation

        XCTAssertNil(animation.fromValue, "From value should be nil")

        let byValue: CGFloat = CGFloat((animation.byValue as? NSNumber)!.doubleValue)
        XCTAssertEqual(byValue, by, "From value should be \(by)")

        XCTAssertNil(animation.toValue, "To value should be nil")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, AnchorPoint.Z.keyPath, "KeyPath should be \(AnchorPoint.Z.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }

    func testBasicAnimationTo() {

        let finish: CGFloat = 0.4
        let duration: TimeInterval = 2
        let basicAnchorPointToDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.Y>.to(finish, duration: duration)
        self.layer.addAnimation(describedBy: basicAnchorPointToDescriptor, forKey: "animation")
        let animation = self.layer.animation(forKey: "animation") as! CABasicAnimation

        XCTAssertNil(animation.fromValue, "From value should be nil")
        XCTAssertNil(animation.byValue, "By value should be nil")

        let toValue: CGFloat = CGFloat((animation.toValue as? NSNumber)!.doubleValue)
        XCTAssertEqual(toValue, finish, "To value should be \(finish)")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, AnchorPoint.Y.keyPath, "KeyPath should be \(AnchorPoint.Y.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }

    func testBasicAnimationFromTo() {

        let startPoint: CGPoint = .zero
        let finishPoint: CGPoint = CGPoint(x: 0.5, y: 0.4)
        let duration: TimeInterval = 2
        let basicAnchorPointFromToDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint>.from(startPoint, to: finishPoint, duration: duration)

        self.layer.addAnimation(describedBy: basicAnchorPointFromToDescriptor, forKey: "animation1")
        let animation1 = self.layer.animation(forKey: "animation1") as! CABasicAnimation

        let fromValue1: CGPoint? = (animation1.fromValue as? NSValue)?.cgPointValue
        XCTAssertEqual(fromValue1, startPoint, "From value should be \(startPoint)")

        XCTAssertNil(animation1.byValue, "By value should be nil")

        let toValue1: CGPoint? = (animation1.toValue as? NSValue)?.cgPointValue
        XCTAssertEqual(toValue1, finishPoint, "To value should be \(finishPoint)")

        let keyPath1 = animation1.keyPath
        XCTAssertEqual(keyPath1, AnchorPoint.keyPath, "KeyPath should be \(AnchorPoint.keyPath)")

        XCTAssertEqual(duration, animation1.duration, "Duration should be \(duration)")


        let start: CGFloat = 0
        let finish: CGFloat = 0.5
        let basicAnchorPointXFromToDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>.from(start, to: finish, duration: duration)
        self.layer.addAnimation(describedBy: basicAnchorPointXFromToDescriptor, forKey: "animation2")
        let animation2 = self.layer.animation(forKey: "animation2") as! CABasicAnimation

        let fromValue2: CGFloat = CGFloat((animation2.fromValue as? NSNumber)!.doubleValue)
        XCTAssertEqual(fromValue2, start, "From value should be \(start)")

        XCTAssertNil(animation2.byValue, "By value should be nil")

        let toValue2: CGFloat = CGFloat((animation2.toValue as? NSNumber)!.doubleValue)
        XCTAssertEqual(toValue2, finish, "To value should be \(finish)")

        let keyPath2 = animation2.keyPath
        XCTAssertEqual(keyPath2, AnchorPoint.X.keyPath, "KeyPath should be \(AnchorPoint.X.keyPath)")
        XCTAssertEqual(duration, animation2.duration, "Duration should be \(duration)")
        XCTAssertEqual(CAMediaTimingFillMode.removed, animation2.fillMode, "FillMode should be .removed")
        XCTAssertTrue(animation2.isRemovedOnCompletion, "isRemovedOnCompletion should be true")
        XCTAssertNil(animation2.delegate, "Delegate should be nil")
    }

    func testBasicAnimationFromBy() {

        let start: CGFloat = 0
        let by: CGFloat = 0.5
        let duration: TimeInterval = 2

        let timingProperties: [SwiftyCoreAnimation.PropertiesApplicableToBasicAnimations] = [SwiftyCoreAnimation.Properties.MediaTiming.fillMode(.backwards), Properties.isRemovedOnCompletion(false)]
        let basicAnchorPointFromByDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>.from(start, by: by, duration: duration, otherAnimationProperties: timingProperties)
        self.layer.addAnimation(describedBy: basicAnchorPointFromByDescriptor, forKey: "animation")
        let animation = self.layer.animation(forKey: "animation") as! CABasicAnimation

        let fromValue: CGFloat = CGFloat((animation.fromValue as? NSNumber)!.doubleValue)
        XCTAssertEqual(fromValue, start, "From value should be \(start)")

        let byValue: CGFloat = CGFloat((animation.byValue as? NSNumber)!.doubleValue)
        XCTAssertEqual(byValue, by, "By value should be \(by)")

        XCTAssertNil(animation.toValue, "To value should be nil")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, AnchorPoint.X.keyPath, "KeyPath should be \(AnchorPoint.X.keyPath)")
        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
        XCTAssertEqual(CAMediaTimingFillMode.backwards, animation.fillMode, "FillMode should be .backwards")
        XCTAssertFalse(animation.isRemovedOnCompletion, "isRemovedOnCompletion should be false")
    }

    func testBasicAnimationByTo() {

        let start: CGFloat = 0
        let finish: CGFloat = 0.5
        let duration: TimeInterval = 2
        let basicAnchorPointByToDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>.by(start, to: finish, duration: duration)
        self.layer.addAnimation(describedBy: basicAnchorPointByToDescriptor, forKey: "animation")
        let animation = self.layer.animation(forKey: "animation") as! CABasicAnimation

        XCTAssertNil(animation.fromValue, "From value should be nil")

        let byValue: CGFloat = CGFloat((animation.byValue as? NSNumber)!.doubleValue)
        XCTAssertEqual(byValue, start, "By value should be \(start)")

        let toValue: CGFloat = CGFloat((animation.toValue as? NSNumber)!.doubleValue)
        XCTAssertEqual(toValue, finish, "To value should be \(finish)")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, AnchorPoint.X.keyPath, "KeyPath should be \(AnchorPoint.X.keyPath)")
        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }
}
