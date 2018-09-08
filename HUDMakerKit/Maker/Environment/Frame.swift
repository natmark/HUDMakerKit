//
//  Frame.swift
//  HUDMakerKit
//
//  Created by AtsuyaSato on 2018/09/08.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation

class FrameComponents {
    var bounds: CGRect = CGRect.zero
    var frame: CGRect = CGRect.zero
    var center: CGPoint = CGPoint.zero
}

protocol FrameModelContract {
    var width: CGFloat { get }
    var height: CGFloat { get }
    var centerX: CGFloat { get }
    var centerY: CGFloat { get }
}

struct FrameModel: FrameModelContract {
    private var frameComponents: FrameComponents

    init(frameComponents: FrameComponents) {
        self.frameComponents = frameComponents
    }

    var width: CGFloat {
        return self.frameComponents.bounds.size.width
    }

    var height: CGFloat {
        return self.frameComponents.bounds.size.height
    }

    var centerX: CGFloat {
        return self.frameComponents.center.x
    }

    var centerY: CGFloat {
        return self.frameComponents.center.y
    }
}

extension HUDMaker: FrameModelContract {
    public var width: CGFloat {
        return self.frameModel.width
    }

    public var height: CGFloat {
        return self.frameModel.height
    }

    public var centerX: CGFloat {
        return self.frameModel.centerX
    }

    public var centerY: CGFloat {
        return self.frameModel.centerY
    }

}

