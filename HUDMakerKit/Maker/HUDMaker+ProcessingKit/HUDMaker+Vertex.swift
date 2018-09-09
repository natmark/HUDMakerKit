//
//  HUDMaker+Vertex.swift
//  HUDMakerKit
//
//  Created by AtsuyaSato on 2018/09/10.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import ProcessingKit

extension HUDMaker: VertexModelContract {
    public func beginShape(_ kind: BeginShapeKind = .none) {
        self.vertexModel.beginShape(kind)
    }

    public func endShape(_ mode: EndShapeMode = .none) {
        self.vertexModel.endShape(mode)
    }

    public func vertex(_ x: CGFloat, _ y: CGFloat) {
        self.vertexModel.vertex(x, y)
    }
}
