//
//  CATransactionTests.swift
//  SwiftyCoreAnimationTests
//
//  Created by Franklyn on 07/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import XCTest
@testable import SwiftyCoreAnimation


class CATransactionTests: XCTestCase {

    // tests the extensions to CATransaction
    
    private lazy var layer: CALayer = {
        return CALayer()
    }()
    private lazy var shapeLayer: CAShapeLayer = {
        return CAShapeLayer()
    }()
    private lazy var emitterLayer: CAEmitterLayer = {
        return CAEmitterLayer()
    }()
    private lazy var gradientLayer: CAGradientLayer = {
        return CAGradientLayer()
    }()
    private lazy var replicatorLayer: CAReplicatorLayer = {
        return CAReplicatorLayer()
    }()
    private lazy var textLayer: CATextLayer = {
        return CATextLayer()
    }()


    func testCreateCATransaction() {

        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2)
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFrameColorsDescriptor = Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.path(path, duration: 2)

        let properties: [LayerProperty.Type] = [AnchorPoint.self, BorderWidth.self]
        let disabledAnimations = self.layer.disabledImplicitAnimations(for: properties)
        
        let animations: () -> () = {
            self.layer.addAnimation(describedBy: basicAnchorPointDescriptor)
            self.shapeLayer.addAnimation(describedBy: keyFrameColorsDescriptor)
            self.layer.borderColor = UIColor.red.cgColor
        }

        let expectation: XCTestExpectation = self.expectation(description: "Transaction finished")

        let transaction = CATransaction.transactionWithAnimations(animations, duration: 2, using: CAMediaTimingFunction(name: .easeInEaseOut), disableImplicitAnimationsFor: [disabledAnimations], transactionCompletion: {
            expectation.fulfill()
        })

        transaction()

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })

        // tests that the animations are actually carried out during the transaction

        XCTAssertEqual(self.layer.borderColor, UIColor.red.cgColor, "Should be equal")


        // test the other constructor

        self.layer.borderColor = UIColor.black.cgColor // reset the layer border color
        let expectation2: XCTestExpectation = self.expectation(description: "Transaction finished")

        let transaction2 = CATransaction.transactionWithAnimations(animations, duration: 2, using: CAMediaTimingFunction(name: .easeInEaseOut), disableImplicitAnimations: false) {
            expectation2.fulfill()
        }

        transaction2()

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })

        // tests that the animations are actually carried out during the transaction

        XCTAssertEqual(self.layer.borderColor, UIColor.red.cgColor, "Should be equal")
    }

    func testPerformCATransaction() {

        let basicAnchorPointDescriptor = Descriptor.Basic<SwiftyCoreAnimation.AnchorPoint.X>(duration: 2)
        let path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 400, height: 250), transform: nil)
        let keyFrameColorsDescriptor = Descriptor.KeyFrame<SwiftyCoreAnimation.FillColor>.path(path, duration: 2)

        let properties: [LayerProperty.Type] = [AnchorPoint.self, BorderWidth.self]
        let disabledAnimations = self.layer.disabledImplicitAnimations(for: properties)

        let animations: () -> () = {
            self.layer.addAnimation(describedBy: basicAnchorPointDescriptor)
            self.shapeLayer.addAnimation(describedBy: keyFrameColorsDescriptor)
            self.layer.borderColor = UIColor.red.cgColor
        }

        let expectation: XCTestExpectation = self.expectation(description: "Transaction finished")

        CATransaction.performAnimations(animations, duration: 2, disableImplicitAnimationsFor: [disabledAnimations]) {
            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })

        // tests that the animations are actually carried out during the transaction

        XCTAssertEqual(self.layer.borderColor, UIColor.red.cgColor, "Should be equal")


        // test the alternative function

        self.layer.borderColor = UIColor.black.cgColor // reset the layer border color
        let expectation2: XCTestExpectation = self.expectation(description: "Transaction finished")

        CATransaction.performAnimations(animations, duration: 2, disableImplicitAnimations: true) {
            expectation2.fulfill()
        }

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })

        // tests that the animations are actually carried out during the transaction

        XCTAssertEqual(self.layer.borderColor, UIColor.red.cgColor, "Should be equal")
    }

    func testLayerDisabledImplicitAnimations() {

        let properties: [LayerProperty.Type] = [AnchorPoint.self, BorderWidth.self]
        let disabledAnimations = self.layer.disabledImplicitAnimations(for: properties)

        let animations: () -> () = {
            self.layer.borderColor = UIColor.red.cgColor
        }

        let expectation: XCTestExpectation = self.expectation(description: "Transaction finished")

        let transaction = CATransaction.transactionWithAnimations(animations, duration: 2, disableImplicitAnimationsFor: [disabledAnimations]) {
            expectation.fulfill()
        }

        transaction()

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })

        let actions = self.layer.actions

        // test that the required properties are NSNull

        XCTAssertTrue((actions as? [String: NSNull])?[AnchorPoint.keyPath] == NSNull(), "Should be NSNull")
        XCTAssertTrue((actions as? [String: NSNull])?[BorderWidth.keyPath] == NSNull(), "Should be NSNull")

        // now test that other properties aren't also NSNull

        XCTAssertFalse((actions as? [String: NSNull])?[FillColor.keyPath] == NSNull(), "Should not be NSNull")
        XCTAssertFalse((actions as? [String: NSNull])?[Transform.keyPath] == NSNull(), "Should not be NSNull")

        // test that the animation actually happened

        XCTAssertEqual(self.layer.borderColor, UIColor.red.cgColor, "Should be equal")
    }

    func testShapeLayerDisabledImplicitAnimations() {

        let properties: [ShapeLayerProperty.Type] = [FillColor.self, StrokeEnd.self]
        let disabledAnimations = self.shapeLayer.disabledImplicitAnimations(for: properties)

        let animations: () -> () = {
            self.layer.borderColor = UIColor.red.cgColor
        }

        let expectation: XCTestExpectation = self.expectation(description: "Transaction finished")

        let transaction = CATransaction.transactionWithAnimations(animations, duration: 2, disableImplicitAnimationsFor: [disabledAnimations]) {
            expectation.fulfill()
        }

        transaction()

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })

        let actions = self.shapeLayer.actions

        // test that the required properties are NSNull

        XCTAssertTrue((actions as? [String: NSNull])?[FillColor.keyPath] == NSNull(), "Should be NSNull")
        XCTAssertTrue((actions as? [String: NSNull])?[StrokeEnd.keyPath] == NSNull(), "Should be NSNull")

        // now test that other properties aren't also NSNull

        XCTAssertFalse((actions as? [String: NSNull])?[MiterLimit.keyPath] == NSNull(), "Should not be NSNull")
        XCTAssertFalse((actions as? [String: NSNull])?[LineWidth.keyPath] == NSNull(), "Should not be NSNull")
    }

    func testEmitterLayerDisabledImplicitAnimations() {

        let properties: [EmitterLayerProperty.Type] = [EmitterSize.self, BirthRate.self]
        let disabledAnimations = self.emitterLayer.disabledImplicitAnimations(for: properties)

        let animations: () -> () = {
            self.layer.borderColor = UIColor.red.cgColor
        }

        let expectation: XCTestExpectation = self.expectation(description: "Transaction finished")

        let transaction = CATransaction.transactionWithAnimations(animations, duration: 2, disableImplicitAnimationsFor: [disabledAnimations]) {
            expectation.fulfill()
        }

        transaction()

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })

        let actions = self.emitterLayer.actions

        // test that the required properties are NSNull

        XCTAssertTrue((actions as? [String: NSNull])?[EmitterSize.keyPath] == NSNull(), "Should be NSNull")
        XCTAssertTrue((actions as? [String: NSNull])?[BirthRate.keyPath] == NSNull(), "Should be NSNull")

        // now test that other properties aren't also NSNull

        XCTAssertFalse((actions as? [String: NSNull])?[Lifetime.keyPath] == NSNull(), "Should not be NSNull")
        XCTAssertFalse((actions as? [String: NSNull])?[Spin.keyPath] == NSNull(), "Should not be NSNull")
    }

    func testGradientLayerDisabledImplicitAnimations() {

        let properties: [GradientLayerProperty.Type] = [Colors.self, EndPoint.self]
        let disabledAnimations = self.gradientLayer.disabledImplicitAnimations(for: properties)

        let animations: () -> () = {
            self.layer.borderColor = UIColor.red.cgColor
        }

        let expectation: XCTestExpectation = self.expectation(description: "Transaction finished")

        let transaction = CATransaction.transactionWithAnimations(animations, duration: 2, disableImplicitAnimationsFor: [disabledAnimations]) {
            expectation.fulfill()
        }

        transaction()

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })

        let actions = self.gradientLayer.actions

        // test that the required properties are NSNull

        XCTAssertTrue((actions as? [String: NSNull])?[Colors.keyPath] == NSNull(), "Should be NSNull")
        XCTAssertTrue((actions as? [String: NSNull])?[EndPoint.keyPath] == NSNull(), "Should be NSNull")

        // now test that other properties aren't also NSNull

        XCTAssertFalse((actions as? [String: NSNull])?[Locations.keyPath] == NSNull(), "Should not be NSNull")
        XCTAssertFalse((actions as? [String: NSNull])?[StartPoint.keyPath] == NSNull(), "Should not be NSNull")
    }

    func testReplicatorLayerDisabledImplicitAnimations() {

        let properties: [ReplicatorLayerProperty.Type] = [InstanceDelay.self, InstanceBlueOffset.self]
        let disabledAnimations = self.replicatorLayer.disabledImplicitAnimations(for: properties)

        let animations: () -> () = {
            self.layer.borderColor = UIColor.red.cgColor
        }

        let expectation: XCTestExpectation = self.expectation(description: "Transaction finished")

        let transaction = CATransaction.transactionWithAnimations(animations, duration: 2, disableImplicitAnimationsFor: [disabledAnimations]) {
            expectation.fulfill()
        }

        transaction()

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })

        let actions = self.replicatorLayer.actions

        // test that the required properties are NSNull

        XCTAssertTrue((actions as? [String: NSNull])?[InstanceDelay.keyPath] == NSNull(), "Should be NSNull")
        XCTAssertTrue((actions as? [String: NSNull])?[InstanceBlueOffset.keyPath] == NSNull(), "Should be NSNull")

        // now test that other properties aren't also NSNull

        XCTAssertFalse((actions as? [String: NSNull])?[InstanceRedOffset.keyPath] == NSNull(), "Should not be NSNull")
        XCTAssertFalse((actions as? [String: NSNull])?[InstanceAlphaOffset.keyPath] == NSNull(), "Should not be NSNull")
    }

    func testTextLayerDisabledImplicitAnimations() {

        let properties: [TextLayerProperty.Type] = [FontSize.self]
        let disabledAnimations = self.textLayer.disabledImplicitAnimations(for: properties)

        let animations: () -> () = {
            self.layer.borderColor = UIColor.red.cgColor
        }

        let expectation: XCTestExpectation = self.expectation(description: "Transaction finished")

        let transaction = CATransaction.transactionWithAnimations(animations, duration: 2, disableImplicitAnimationsFor: [disabledAnimations]) {
            expectation.fulfill()
        }

        transaction()

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })

        let actions = self.textLayer.actions

        // test that the required properties are NSNull

        XCTAssertTrue((actions as? [String: NSNull])?[FontSize.keyPath] == NSNull(), "Should be NSNull")

        // now test that other properties aren't also NSNull

        XCTAssertFalse((actions as? [String: NSNull])?[ForegroundColor.keyPath] == NSNull(), "Should not be NSNull")
    }
}
