//
//  HUDMaker+ProcessingKit.swift
//  HUDMakerKit
//
//  Created by AtsuyaSato on 2018/09/10.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation


//
//  ProcessingView+Frame.swift
//  ProcessingKit
//
//  Created by AtsuyaSato on 2018/09/09.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import ProcessingKit

extension HUDMaker: FrameModelContract {
    public var frameRate: CGFloat {
        return self.frameModel.frameRate
    }

    public var width: CGFloat {
        return self.frameModel.width
    }

    public var height: CGFloat {
        return self.frameModel.height
    }

    public var centerX: CGFloat {
        return self.HUDcenter.x
    }

    public var centerY: CGFloat {
        return self.HUDcenter.y
    }

    public func frameRate(_ fps: CGFloat) {
        self.frameModel.frameRate(fps)

        self.timer?.invalidate()
        self.timer = nil
        self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(1.0 / fps), target: self, selector: #selector(update(timer:)), userInfo: nil, repeats: true)
    }

    public func delay(napTime: Int) {
        let delayInSeconds = Double(napTime) / 1000.0
        self.timer?.invalidate()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            self.timer?.fire()
        }
    }

    @objc func update(timer: Timer) {
        self.draw(self.frame)
    }
}
