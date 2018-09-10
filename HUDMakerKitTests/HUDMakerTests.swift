//
//  HUDMakerTests.swift
//  HUDMakerKitTests
//
//  Created by AtsuyaSato on 2018/09/08.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import XCTest
@testable import HUDMakerKit

class HUDMakerTests: XCTestCase {
    func testCallDraw() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let HUD = HUDMaker(frame: CGRect.zero)

        let HUDMakerDelegateSpy = HUDMakerDelegateDrawSpy(exception:
            expectation(description: "Draw")
        )

        HUD.delegate = HUDMakerDelegateSpy
        waitForExpectations(timeout: 100)
        print(HUDMakerDelegateSpy.spyHistory.count)
        XCTAssertEqual(HUDMakerDelegateSpy.spyHistory.count, 1)
    }
}
