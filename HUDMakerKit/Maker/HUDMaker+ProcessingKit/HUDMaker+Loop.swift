//
//  HUDMaker+Loop.swift
//  HUDMakerKit
//
//  Created by AtsuyaSato on 2018/09/10.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import ProcessingKit

extension HUDMaker: LoopModelContract {
    public func loop() {
        self.timer?.fire()
    }

    public func noLoop() {
        self.timer?.invalidate()
        self.timer = nil
    }
}
