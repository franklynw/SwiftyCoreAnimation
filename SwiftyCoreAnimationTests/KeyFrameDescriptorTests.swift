//
//  KeyFrameDescriptorTests.swift
//  SwiftyCoreAnimationTests
//
//  Created by Franklyn on 05/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import XCTest
@testable import SwiftyCoreAnimation


class KeyFrameDescriptorTests: XCTestCase {

    // Test all the keyframe animation descriptor constructors
    // Probably a fair assumption that if we can construct the descriptors for one property, it'll be ok for all of them

    private lazy var layer: CAShapeLayer = {
        return CAShapeLayer()
    }()


    func testKeyFramePathAnimation() {

        let duration: TimeInterval = 2
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFrameColorsDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.path(path, duration: duration)
        let animation = self.layer.addKeyFrameAnimation(describedBy: keyFrameColorsDescriptor)

        let pathValue: CGPath? = animation.path
        XCTAssertEqual(pathValue, path, "Should be equal")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, SwiftyCoreAnimation.FillColor.keyPath, "KeyPath should be \(SwiftyCoreAnimation.FillColor.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }

    func testKeyFrameValuesAnimation() {

        let duration: TimeInterval = 2
        let values: [UIColor] = [.red, .green, .blue]
        let keyFrameColorsDescriptor = SwiftyCoreAnimation.Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.values(values, duration: duration)
        let animation = self.layer.addKeyFrameAnimation(describedBy: keyFrameColorsDescriptor)

        let animationValues: [CGColor]? = animation.values as? [CGColor]
        let animationColorComponents: [[CGFloat]]? = animationValues?.compactMap { $0.components }
        let valuesColorComponents: [[CGFloat]] = values.compactMap { $0.cgColor.components }

        XCTAssertEqual(animationColorComponents, valuesColorComponents, "Should be equal")

        let keyPath = animation.keyPath
        XCTAssertEqual(keyPath, SwiftyCoreAnimation.FillColor.keyPath, "KeyPath should be \(SwiftyCoreAnimation.FillColor.keyPath)")

        XCTAssertEqual(duration, animation.duration, "Duration should be \(duration)")
    }
}
