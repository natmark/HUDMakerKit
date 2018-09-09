//
//  Color.swift
//  HUDMakerKit
//
//  Created by AtsuyaSato on 2018/09/08.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation

class ColorComponents {
    var fill: UIColor = UIColor.white
    var stroke: UIColor = UIColor.clear
    var strokeWeight: CGFloat = 1.0
}

protocol ColorModelContract {
    func background(_ color: UIColor)
    func background(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat)
    func background(_ c: CGFloat)
    func clear()
    func fill(_ color: UIColor)
    func fill(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat)
    func fill(_ c: CGFloat)
    func stroke(_ color: UIColor)
    func stroke(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat)
    func stroke(_ c: CGFloat)
    func strokeWeight(_ weight: CGFloat)
    func noFill()
    func noStroke()
}

struct ColorModel: ColorModelContract {
    private var colorComponents: ColorComponents
    private var frameComponents: FrameComponents

    init(colorComponents: ColorComponents, frameComponents: FrameComponents) {
        self.colorComponents = colorComponents
        self.frameComponents = frameComponents
    }

    func background(_ color: UIColor) {
        let g = UIGraphicsGetCurrentContext()
        g?.clear(self.frameComponents.bounds)
    }

    func background(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) {
        self.background(UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a / 255.0))
    }

    func background(_ c: CGFloat) {
        self.background(c, c, c, 255)
    }

    func clear() {
        let g = UIGraphicsGetCurrentContext()
        g?.clear(self.frameComponents.bounds)
    }

    func fill(_ color: UIColor) {
        self.colorComponents.fill = color
    }

    func fill(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) {
        self.fill(UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a / 255.0))
    }

    func fill(_ c: CGFloat) {
        self.fill(c, c, c, 255)
    }

    func stroke(_ color: UIColor) {
        self.colorComponents.stroke = color
    }

    func stroke(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) {
        self.stroke(UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a / 255.0))
    }

    func stroke(_ c: CGFloat) {
        self.stroke(c, c, c, 255)
    }

    func strokeWeight(_ weight: CGFloat) {
        self.colorComponents.strokeWeight = weight
    }

    func noFill() {
        self.colorComponents.fill = UIColor.clear
    }

    func noStroke() {
        self.colorComponents.stroke = UIColor.clear
    }
}

extension HUDMaker: ColorModelContract {
    public func background(_ color: UIColor) {
        self.colorModel.background(color)
        self.backgroundColor = color
    }

    public func background(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 255) {
        self.colorModel.background(r, g, b, a)
        self.backgroundColor = UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a / 255.0)
    }

    public func background(_ c: CGFloat) {
        self.colorModel.background(c, c, c, 255)
        self.backgroundColor = UIColor(red: c / 255.0, green: c / 255.0, blue: c / 255.0, alpha: 255 / 255.0)
    }

    public func clear() {
        self.colorModel.clear()
    }

    public func fill(_ color: UIColor) {
        self.colorModel.fill(color)
    }

    public func fill(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 255) {
        self.colorModel.fill(r, g, b, a)
    }

    public func fill(_ c: CGFloat) {
        self.colorModel.fill(c, c, c, 255)
    }

    public func stroke(_ color: UIColor) {
        self.colorModel.stroke(color)
    }

    public func stroke(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 255) {
        self.colorModel.stroke(r, g, b, a)
    }

    public func stroke(_ c: CGFloat) {
        self.colorModel.stroke(c, c, c, 255)
    }

    public func strokeWeight(_ weight: CGFloat) {
        self.colorModel.strokeWeight(weight)
    }

    public func noFill() {
        self.colorModel.noFill()
    }

    public func noStroke() {
        self.colorModel.noStroke()
    }
}
