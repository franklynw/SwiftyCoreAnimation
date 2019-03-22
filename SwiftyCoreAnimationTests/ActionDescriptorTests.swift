//
//  ActionDescriptorTests.swift
//  SwiftyCoreAnimationTests
//
//  Created by Franklyn on 21/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import XCTest
@testable import SwiftyCoreAnimation


class ActionDescriptorTests: XCTestCase {

    // tests the Animation Action Descriptor

    private lazy var layer: CALayer = {
        return CALayer()
    }()
    
    func testAction() {

        let expectation: XCTestExpectation = self.expectation(description: "Action finished")
        
        let actionDescriptor = Descriptor.Action {
            expectation.fulfill()
        }

        do {
            try self.layer.addAnimationSequence(describedBy: [actionDescriptor])
        } catch {
            XCTFail("Animation should have been created")
        }

        self.waitForExpectations(timeout: 5, handler: { error in
            XCTAssertNil(error, "Timed out")
        })
    }
}
