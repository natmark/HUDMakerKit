//
//  HUDMaker+Text.swift
//  HUDMakerKit
//
//  Created by AtsuyaSato on 2018/09/10.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import ProcessingKit

extension HUDMaker: TextModelContract {
    public func text(_ str: String, _ x: CGFloat, _ y: CGFloat) {
        self.textModel.text(str, x, y)
    }

    public func text(_ str: String, _ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.textModel.text(str, x, y, width, height)
    }

    public func textWidth(_ str: String) -> CGFloat {
        return self.textModel.textWidth(str)
    }

    public func textSize(_ size: CGFloat) {
        self.textModel.textSize(size)
    }

    public func textFont(_ font: UIFont) {
        self.textModel.textFont(font)
    }

    public func textAlign(_ allignX: NSTextAlignment) {
        self.textModel.textAlign(allignX)
    }
}
