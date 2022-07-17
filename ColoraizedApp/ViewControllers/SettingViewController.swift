//
//  SettingViewController.swift
//  ColoraizedApp
//
//  Created by Renat Ibragimov on 23.06.2022.
//

import UIKit

class SettingViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redColorValue: UILabel!
    @IBOutlet var greenColorValue: UILabel!
    @IBOutlet var blueColorValue: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    @IBOutlet var redColorTF: UITextField!
    @IBOutlet var greenColorTF: UITextField!
    @IBOutlet var blueColorTF: UITextField!
    
    
    var delegate: SettingViewControllerDelegate!
    var colorisedView: UIColor!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        setValue(for: redColorSlider, greenColorSlider, blueColorSlider)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1
        )
        
        redColorValue.text = (String(format: "%.2f", redColorSlider.value))
        greenColorValue.text = (String(format: "%.2f", greenColorSlider.value))
        blueColorValue.text = (String(format: "%.2f", blueColorSlider.value))
    }
    
    private func setValue(for colorSlider: UISlider...) {
        let ciColor = CIColor(color: colorisedView)
        colorSlider.forEach { slider in
            switch slider {
            case redColorSlider: redColorSlider.value = Float(ciColor.red)
            case greenColorSlider: greenColorSlider.value = Float(ciColor.green)
            default: blueColorSlider.value = Float(ciColor.blue)
            }
        }
    }
}

