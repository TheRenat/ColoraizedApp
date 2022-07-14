//
//  ColorViewController.swift
//  ColoraizedApp
//
//  Created by Renat Ibragimov on 12.07.2022.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setColor(_ color: UIColor)
}

class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.delegate = self
        settingVC.colours = view.backgroundColor?.cgColor.components
    }
}
// MARK: - SettingViewControllerDelegate
extension ColorViewController: SettingViewControllerDelegate {
    func setColor(_ color: UIColor) {
        <#code#>
    }
}

