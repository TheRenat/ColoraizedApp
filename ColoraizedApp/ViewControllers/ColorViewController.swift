//
//  ColorViewController.swift
//  ColoraizedApp
//
//  Created by Renat Ibragimov on 12.07.2022.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setNewValues(red: Float, green: Float, blue: Float)
}

class ColorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
 }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.delegate = self
        settingVC.colours = view.backgroundColor?.cgColor.components
    }
}
// MARK: - SettingViewControllerDelegate
extension ColorViewController: SettingViewControllerDelegate {
    func setNewValues(red: Float, green: Float, blue: Float) {
        view.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1
        )
    }
}

