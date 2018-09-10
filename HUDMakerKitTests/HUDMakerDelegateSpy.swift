//
//  CustomHUD.swift
//  HUDMakerKitTests
//
//  Created by AtsuyaSato on 2018/09/10.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import XCTest
@testable import HUDMakerKit

class HUDMakerDelegateDrawSpy: HUDMakerDelegate {
    private let exception: XCTestExpectation
    private(set) var spyHistory: [Any] = []

    init(exception: XCTestExpectation) {
        self.exception = exception
    }

    func draw(frameCount: Int) {
        self.record(())
        exception.fulfill()
    }

    private func record(_ args: Void) {
        self.spyHistory += [args]
    }
}
