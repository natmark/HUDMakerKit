//
//  HUDMaker+Image.swift
//  HUDMakerKit
//
//  Created by AtsuyaSato on 2018/09/10.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import ProcessingKit

extension HUDMaker: ImageModelContract {
    #if os(iOS)
    public func image(_ img: UIImage, _ x: CGFloat, _ y: CGFloat) {
        self.imageModel.image(img, x, y)
    }

    public func image(_ img: UIImage, _ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.imageModel.image(img, x, y, width, height)
    }
    #elseif os(OSX)
    public func drawImage(_ img: NSImage, _ x: CGFloat, _ y: CGFloat) {
        self.imageModel.drawImage(img, x, y)
    }

    public func drawImage(_ img: NSImage, _ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.imageModel.drawImage(img, x, y, width, height)
    }
    #endif
}
