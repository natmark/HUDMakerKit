//
//  HUDRunner.swift
//  HUDMakerKit
//
//  Created by AtsuyaSato on 2018/09/08.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation

public protocol HUDInterface {
    func show()
    func dismiss()
    var blocking: Bool { get set }
}

public class HUDRunner: UIWindow {
    public var performDelay = 0.0
    public var customHUD: HUDMaker? {
        didSet {
            guard let customHUD = customHUD else {
                return
            }
            customHUD.frame = centerRect(bounds: self.bounds, width: customHUD.frame.size.width, height: customHUD.frame.size.height)
            customHUD.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin,
                                        .flexibleBottomMargin, .flexibleTopMargin]
            customHUD.stop()

            self.subviews.forEach { $0.removeFromSuperview() }
            self.addSubview(customHUD)
        }
    }

    public static var shared: HUDRunner = {
        return HUDRunner(frame: UIScreen.main.bounds)
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)

        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.windowLevel = UIWindowLevelAlert
        self.isUserInteractionEnabled = false
    }

    @available(iOS, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func centerRect(bounds: CGRect, width: CGFloat, height: CGFloat) -> CGRect {
        let x = bounds.origin.x + (bounds.size.width - width) / 2
        let y = bounds.origin.y + (bounds.size.height - height) / 2
        return CGRect(x: x, y: y, width: width, height: height)
    }

    @objc func start() {
        HUDRunner.shared.isHidden = false
    }
}

extension HUDRunner: HUDInterface {
    public var blocking: Bool {
        get {
            return self.isUserInteractionEnabled
        }
        set {
            self.isUserInteractionEnabled = blocking
        }
    }

    public func show() {
        let shared = HUDRunner.shared

        if !shared.isHidden {
            return
        }
        customHUD?.run()

        shared.perform(#selector(start), with: nil, afterDelay: performDelay)
    }

    public func dismiss() {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(start), object: nil)

        self.isHidden = true
        customHUD?.stop()
    }
}
