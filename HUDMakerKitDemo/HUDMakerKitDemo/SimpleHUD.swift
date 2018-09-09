//
//  SimpleHUD.swift
//  HUDMakerKitDemo
//
//  Created by AtsuyaSato on 2018/09/09.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation
import HUDMakerKit

class SimpleHUD: HUDMaker {
    func draw(frameCount: Int) {
        clear()
        translate(width/2, height/2)
        rotate(CGFloat(frameCount)*0.02)

        let radius = CGFloat(40)
        var t = 0
        while( t < 360 ) {
            let radian = radians(CGFloat(t))
            let x = radius * cos(radian)
            let y = radius * sin(radian)
            stroke(128, 0, 128)
            strokeWeight(6)
            point(x, y)
            t += 15
        }
    }
}
