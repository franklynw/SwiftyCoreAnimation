//
//  WaitDescriptorTests.swift
//  SwiftyCoreAnimationTests
//
//  Created by Franklyn on 21/03/2019.
//  Copyright © 2019 Franklyn. All rights reserved.
//

import XCTest
@testable import SwiftyCoreAnimation

/*
// Can't get this test to work, as the animation won't actually animate when the view is not real
class WaitDescriptorTests: XCTestCase {

    // tests the Animation Wait Descriptor

    private lazy var layer: CALayer = {
        return CALayer()
    }()

    func testWait() {

        let expectation: XCTestExpectation = self.expectation(description: "Waiting")

        let waitDescriptor = Descriptor.Wait(for: 3)
        let start = CACurrentMediaTime()

        do {
            try self.layer.addAnimationSequence(describedBy: [waitDescriptor]) { _, _ in
                expectation.fulfill()
            }
        } catch {
            XCTFail("Animation should have been created")
        }

        self.waitForExpectations(timeout: 5, handler: { error in
            let timeElapsed = CACurrentMediaTime() - start
            XCTAssertTrue(timeElapsed > 2.9, "Wait was too short (\(timeElapsed))")
            XCTAssertTrue(timeElapsed < 3.1, "Wait was too long (\(timeElapsed))")
        })
    }
}
*/
