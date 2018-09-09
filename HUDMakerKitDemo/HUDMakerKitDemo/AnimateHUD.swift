//
//  AnimateHUD.swift
//  HUDMakerKitDemo
//
//  Created by AtsuyaSato on 2018/09/09.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation
import HUDMakerKit

class AnimateHUD: HUDMaker {
    func draw(frameCount: Int) {
        clear()
        let radius = CGFloat(50)
        let ellipseSize = CGFloat(20)
        let numberOfEllipse = 12
        let refreshRate = 5
        let increment = CGFloat(360 - ((frameCount / refreshRate) * 360 / numberOfEllipse)  % 360)

        for i in 0..<numberOfEllipse {
            let alpha = ((360 / numberOfEllipse * i) + Int(increment)) % 360
            fill(0, 150, 255, CGFloat(alpha * 255 / 360))
            let rad = radians(CGFloat(i * 30))
            ellipse(centerX + radius * cos(rad), centerY + radius * sin(rad), ellipseSize, ellipseSize)
        }
    }    
}
