//
//  SettingViewController.swift
//  ColoraizedApp
//
//  Created by Renat Ibragimov on 23.06.2022.
//

import UIKit

class SettingViewController: UIViewController {
    
    var delegate: SettingViewControllerDelegate!
    
    var colorisedView: UIColor!
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redColorValue: UILabel!
    @IBOutlet var greenColorValue: UILabel!
    @IBOutlet var blueColorValue: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        

        
        colorView.backgroundColor = UIColor(
            red: CGFloat(colours[0]),
            green: CGFloat(colours[1]),
            blue: CGFloat(colours[2]),
            alpha: CGFloat(colours[3]))
        
        redColorValue.text = (String(format:"%.2f", (Float(colours[0]))))
        greenColorValue.text = (String(format:"%.2f", (Float(colours[1]))))
        blueColorValue.text = (String(format:"%.2f", (Float(colours[2]))))
        
        redColorSlider.value = Float(colours[0])
        greenColorSlider.value = Float(colours[1])
        blueColorSlider.value = Float(colours[2])
    }
    
    @IBAction func DoneButtonPressed() {
        delegate.setNewValues(
            red: redColorSlider.value,
            green: greenColorSlider.value,
            blue: blueColorSlider.value
        )
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
}

