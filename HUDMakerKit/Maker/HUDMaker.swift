//
//  HUDMaker.swift
//  HUDMakerKit
//
//  Created by AtsuyaSato on 2018/09/08.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation
import ProcessingKit

@objc public protocol HUDMakerDelegate {
    @objc optional func draw(frameCount: Int)
}

open class HUDMaker: UIImageView, HUDMakerDelegate {
    public weak var delegate: HUDMakerDelegate?

    lazy var frameModel: FrameModelContract = {
        return FrameModel(
            frameComponents: self.frameComponents,
            timer: self.timer
        )
    }()
    lazy var shapeModel: ShapeModelContract = {
        return ShapeModel(
            contextComponents: self.contextComponents,
            colorComponents: self.colorComponents
        )
    }()
    lazy var vertexModel: VertexModelContract = {
        return VertexModel(
            contextComponents: self.contextComponents,
            vertexComponents: self.vertexComponents,
            colorComponents: self.colorComponents
        )
    }()
    lazy var eventModel: EventModelContract = {
        return EventModel(
            frameComponents: self.frameComponents,
            eventComponents: self.eventComponents,
            superView: self.superview
        )
    }()
    lazy var dateModel: DateModelContract = {
        return DateModel()
    }()
    lazy var colorModel: ColorModelContract = {
        return ColorModel(
            contextComponents: self.contextComponents,
            colorComponents: self.colorComponents,
            frameComponents: self.frameComponents
        )
    }()
    lazy var textModel: TextModelContract = {
        return TextModel(
            contextComponents: self.contextComponents,
            frameComponents: self.frameComponents,
            textComponents: self.textComponents,
            colorComponents: self.colorComponents
        )
    }()
    lazy var imageModel: ImageModelContract = {
        return ImageModel(contextComponents: self.contextComponents)
    }()

    lazy var transformModel: TransformModelContract = {
        return TransformModel(contextComponents: self.contextComponents)
    }()

    lazy var timer: Timer? = nil
    var HUDcenter: CGPoint = CGPoint.zero

    // MARK: Private properties
    private var contextComponents = ContextComponents()
    private var colorComponents = ColorComponents()
    private var eventComponents = EventComponents()
    private var vertexComponents = VertexComponents()
    private var textComponents = TextComponents()
    private var frameComponents = FrameComponents()
    private var frameCount = 0

    // MARK: - Initializer
    public init() {
        super.init(frame: CGRect.zero)
        configuration()
        run()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
        run()
    }

    @available(iOS, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func draw(_ rect: CGRect) {
        UIGraphicsBeginImageContext(rect.size)
        image?.draw(at: CGPoint.zero)

        // Draw
        frameCount += 1
        delegate?.draw?(frameCount: frameCount)

        let drawnImage = UIGraphicsGetImageFromCurrentImageContext()
        image = drawnImage
        UIGraphicsEndImageContext()
    }

    public func run() {
        stop()
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(1.0 / 60), target: self, selector: #selector(update(timer:)), userInfo: nil, repeats: true)
    }

    public func stop() {
        timer?.invalidate()
        timer = nil
    }

    private func configuration() {
        delegate = self
    }

    // MARK: - Update view bounds
    open override var frame: CGRect {
        didSet {
            frameComponents.frame = self.frame
            frameComponents.bounds = self.bounds
            HUDcenter = CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2)
        }
    }

    open override var bounds: CGRect {
        didSet {
            frameComponents.bounds = self.bounds
            HUDcenter = CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2)
        }
    }

    // MARK: - deinit
    deinit {
        timer?.invalidate()
        timer = nil
    }
}
