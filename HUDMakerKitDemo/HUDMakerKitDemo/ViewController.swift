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
    @IBOutlet weak var tableView: UITableView!

    let cellTitles = [String(describing: SimpleHUD.self), String(describing: AnimateHUD.self), String(describing: PeriodicallyHUD.self)]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = false
    }

    override func viewDidAppear(_ animated: Bool) {
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition(rawValue: 0)!)
    }

    @IBAction func didTapShowButton(_ sender: Any) {
        if !HUDRunner.shared.isHidden {
            return
        }

        var customHUD: HUDMaker
        switch tableView.indexPathForSelectedRow?.row {
        case 0:
            customHUD = SimpleHUD(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        case 1:
            customHUD = AnimateHUD(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        case 2:
            customHUD = PeriodicallyHUD(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        default:
            return
        }
        customHUD.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.3)
        customHUD.layer.cornerRadius = 10
        HUDRunner.shared.customHUD = customHUD
        HUDRunner.shared.show()
    }

    @IBAction func didTapStopButton(_ sender: Any) {
        HUDRunner.shared.dismiss()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")!

        cell.textLabel?.text = cellTitles[indexPath.row]
        cell.selectionStyle = .none

        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        cell?.accessoryType = .checkmark
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        cell?.accessoryType = .none
    }
}

