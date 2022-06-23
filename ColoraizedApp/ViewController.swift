//
//  ViewController.swift
//  ColoraizedApp
//
//  Created by Renat Ibragimov on 23.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redColorValue: UILabel!
    @IBOutlet var greenColorValue: UILabel!
    @IBOutlet var blueColorValue: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderSetup(color: redColorSlider)
        colorView.backgroundColor = .red.getRed(<#T##red: UnsafeMutablePointer<CGFloat>?##UnsafeMutablePointer<CGFloat>?#>, green: <#T##UnsafeMutablePointer<CGFloat>?#>, blue: <#T##UnsafeMutablePointer<CGFloat>?#>, alpha: <#T##UnsafeMutablePointer<CGFloat>?#>)
        
    }

    @IBAction func redColorSliderAction() {
        redColorValue.text = "\(redColorSlider.value)"
        colorView.backgroundColor = .red
    }
    
    @IBAction func greenColorSliderAction() {
    }
    
    @IBAction func blueColorSliderAction() {
    }
    
    
    private func sliderSetup(color: UISlider) {
        color.value = 0.3
        color.maximumValue = 1.0
        color.minimumValue = 0.0
    }
}

