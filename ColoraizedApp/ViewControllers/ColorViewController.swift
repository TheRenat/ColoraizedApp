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
        
        view.backgroundColor = UIColor(
            red: CGFloat(0.0),
            green: CGFloat(0.0),
            blue: CGFloat(0.0),
            alpha: 1)
 }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingViewController else { return }
        settingVC.delegate = self
        settingVC.colours = view.backgroundColor?.cgColor.components

        
        
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.source as? SettingViewController else { return }
        
        print("Exit")
        print(colorVC.redColorSlider.value)
        print(colorVC.greenColorSlider.value)
        print(colorVC.blueColorSlider.value)
        
        
        view.backgroundColor = UIColor(
            red: CGFloat(colorVC.redColorSlider.value),
            green: CGFloat(colorVC.greenColorSlider.value),
            blue: CGFloat(colorVC.blueColorSlider.value),
            alpha: 1
        )
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

