//
//  Transform.swift
//  HUDMakerKit
//
//  Created by AtsuyaSato on 2018/09/09.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation

protocol TransformModelContract {
    func pushMatrix()
    func popMatrix()
    func scale(_ s: CGFloat)
    func scale(_ x: CGFloat, _ y: CGFloat)
    func shear(_ angleX: CGFloat, _ angleY: CGFloat)
    func rotate(_ angle: CGFloat)
    func translate(_ x: CGFloat, _ y: CGFloat)
}

struct TransformModel: TransformModelContract {
    func pushMatrix() {
        let g = UIGraphicsGetCurrentContext()
        g?.saveGState()
    }

    func popMatrix() {
        let g = UIGraphicsGetCurrentContext()
        g?.restoreGState()
    }

    func scale(_ s: CGFloat) {
        let g = UIGraphicsGetCurrentContext()
        g?.scaleBy(x: s, y: s)

    }

    func scale(_ x: CGFloat, _ y: CGFloat) {
        let g = UIGraphicsGetCurrentContext()
        g?.scaleBy(x: x, y: y)
    }

    func shear(_ angleX: CGFloat, _ angleY: CGFloat) {
        let g = UIGraphicsGetCurrentContext()
        g?.concatenate(CGAffineTransform(a: 1, b: tan(angleY), c: tan(angleX), d: 1, tx: 0, ty: 0))
    }

    func rotate(_ angle: CGFloat) {
        let g = UIGraphicsGetCurrentContext()
        g?.rotate(by: angle)
    }

    func translate(_ x: CGFloat, _ y: CGFloat) {
        let g = UIGraphicsGetCurrentContext()
        g?.translateBy(x: x, y: y)
    }
}

extension HUDMaker: TransformModelContract {
    public func pushMatrix() {
        self.transformModel.pushMatrix()
    }

    public func popMatrix() {
        self.transformModel.popMatrix()
    }

    public func scale(_ s: CGFloat) {
        self.transformModel.scale(s)
    }

    public func scale(_ x: CGFloat, _ y: CGFloat) {
        self.transformModel.scale(x, y)
    }

    public func shear(_ angleX: CGFloat, _ angleY: CGFloat) {
        self.transformModel.shear(angleX, angleY)
    }

    public func rotate(_ angle: CGFloat) {
        self.transformModel.rotate(angle)
    }

    public func translate(_ x: CGFloat, _ y: CGFloat) {
        self.transformModel.translate(x, y)
    }
}
