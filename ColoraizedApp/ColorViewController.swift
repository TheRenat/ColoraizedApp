//
//  ColorViewController.swift
//  ColoraizedApp
//
//  Created by Renat Ibragimov on 12.07.2022.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setNewValues(red: Int, green: Int, blue: Int)
}

class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
// MARK: - SettingViewControllerDelegate
extension ColorViewController: SettingViewControllerDelegate {
    func setNewValues(red: Int, green: Int, blue: Int) {
        view.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1
        )
    }
}

