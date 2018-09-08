//
//  CGPoint.swift
//  HUDMakerKit
//
//  Created by AtsuyaSato on 2018/09/09.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation

extension CGPoint {
    func addTo(_ a: CGPoint) -> CGPoint {
        return CGPoint(x: self.x + a.x, y: self.y + a.y)
    }

    func deltaTo(_ a: CGPoint) -> CGPoint {
        return CGPoint(x: self.x - a.x, y: self.y - a.y)
    }

    func multiplyBy(_ value: CGFloat) -> CGPoint {
        return CGPoint(x: self.x * value, y: self.y * value)
    }

    func length() -> CGFloat {
        return CGFloat(sqrt(CDouble(
            self.x*self.x + self.y*self.y
        )))
    }
}
