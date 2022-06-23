//
//  ViewController.swift
//  ColoraizedApp
//
//  Created by Renat Ibragimov on 23.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderSetup(color: redColorSlider)
        
    }

    @IBAction func redColorSliderAction() {
    }
    
    @IBAction func greenColorSliderAction() {
    }
    
    @IBAction func blueColorSliderAction() {
    }
    
    
    private func sliderSetup(color: UISlider) {
        color.value = 0.2
        color.maximumValue = 1
        color.minimumValue = 0
    }
}

