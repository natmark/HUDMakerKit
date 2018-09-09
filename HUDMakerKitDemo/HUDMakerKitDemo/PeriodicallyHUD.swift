//
//  PeriodicallyHUD.swift
//  HUDMakerKitDemo
//
//  Created by AtsuyaSato on 2018/09/08.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation
import HUDMakerKit

class PeriodicallyHUD: HUDMaker {
    let spotCntMax = CGFloat(30)
    let stepCntMax = CGFloat(20)
    var stepCnt = CGFloat(0)

    func draw(frameCount: Int) {
        clear()

        var spotCnt = CGFloat(1)
        while spotCnt <= spotCntMax {
            spotCnt += 1

            let radius = map(spotCnt, 1, spotCntMax, 10, 60)
            let speed = map(spotCnt, 1, spotCntMax, 4.0, 0.1)
            let radian = .pi * speed * stepCnt

            let x = radius * cos(radian) + width / 2
            let y = radius * sin(radian) + height / 2

            fill(UIColor(hue: (spotCnt * 10) / 255.0, saturation: 255.0 / 255.0, brightness: 255.0 / 255.0, alpha: 100 / 255.0))
            ellipse(x, y, 10, 10)
        }

        stepCnt += 0.02;
        if (stepCnt > stepCntMax) {
            stepCnt = 0
        }
    }

    func map(_ value: CGFloat, _ start1: CGFloat, _ end1: CGFloat, _ start2: CGFloat, _ end2: CGFloat) -> CGFloat {
        return start2 + (end2 - start2) * ((value - start1) / (end1 - start1))
    }
}
