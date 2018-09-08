//
//  ViewController.swift
//  HUDMakerKitDemo
//
//  Created by AtsuyaSato on 2018/09/08.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import UIKit
import HUDMakerKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let customHUD = CustomHUD(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        customHUD.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        customHUD.layer.cornerRadius = 10
        HUDRunner.shared.customHUD = customHUD
    }

    @IBAction func didTapShowButton(_ sender: Any) {
        HUDRunner.shared.show()
    }

    @IBAction func didTapStopButton(_ sender: Any) {
        HUDRunner.shared.dismiss()
    }
}

