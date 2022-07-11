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
        
        colorView.layer.cornerRadius = 10
        sliderSetup(color: redColorSlider)
        sliderSetup(color: greenColorSlider)
        sliderSetup(color: blueColorSlider)
        
        redColorSliderAction()
        greenColorSliderAction()
        blueColorSliderAction()
        
        redColorSlider.minimumTrackTintColor = .red
        greenColorSlider.minimumTrackTintColor = .green
        blueColorSlider.minimumTrackTintColor = .blue
    }
    
    @IBAction func redColorSliderAction() {
        redColorValue.text = (String(format: "%.2f", redColorSlider.value))
        
        sliderActionSetup()
    }
    
    @IBAction func greenColorSliderAction() {
        greenColorValue.text = (String(format: "%.2f", greenColorSlider.value))
        
        sliderActionSetup()
    }
    
    @IBAction func blueColorSliderAction() {
        blueColorValue.text = (String(format: "%.2f", blueColorSlider.value))
        
        sliderActionSetup()
    }
    
    private func sliderSetup(color: UISlider) {
        color.value = Float.random(in: color.minimumValue...color.maximumValue)
    }
    private func sliderActionSetup() {
        colorView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
    }
}
