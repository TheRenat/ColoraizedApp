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
        sliderSetup(color: greenColorSlider)
        sliderSetup(color: blueColorSlider)
        
        redColorSliderAction()
        greenColorSliderAction()
        blueColorSliderAction()
        
       // redColorSliderAction()
        
        
        colorView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
        
        
        
        //colorView.backgroundColor?.rgba = (0.1, 0.2, 0.3, 1.0)
        
//        var cet: CGFloat = 1.0
//        var red = redColorSlider.value
//        var red = redColorSlider.value
//        var red = redColorSlider.value
//        
//        colorView.backgroundColor!.getRed(redColorSlider?.value, green: redColorSlider?.value, blue: redColorSlider?.value, alpha: cet?)
        
        //let cs = CGColorSpace(name: colorView)
//        let cc = CGColor(colorSpace: colorView.backgroundColor! CGColorSpace, components: [0.9, 0.1, 0.9, 1.0])
//        let color = UIColor(cgColor: cc!)
        
//        colorView.backgroundColor = UIColor(CGColor((colorSpace: colorView.backgroundColor! ,components: [0.9, 0.1, 0.9, 1.0])))
//
//
//        let cs: CGColorSpace = (colorView.backgroundColor! as! CGColorSpace?)!
//        let cc = CGColor(colorSpace: cs!, CGColorSpace, components: [0.9, 0.1, 0.9, 1.0])
//        let color = UIColor(cgColor: cc!)
//
        
        
        //colorView.backgroundColor = UIColor.tintColor(redColorSlider.value)
    }

    @IBAction func redColorSliderAction() {
        redColorValue.text = "\(redColorSlider.value)"
        colorView.backgroundColor = .red
        colorView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
    }
    
    @IBAction func greenColorSliderAction() {
        greenColorValue.text = "\(greenColorSlider.value)"
        colorView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
    }
    
    @IBAction func blueColorSliderAction() {
        blueColorValue.text = "\(blueColorSlider.value)"
        colorView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
    }
    
    
    private func sliderSetup(color: UISlider) {
        color.value = 0.3
        color.maximumValue = 1.0
        color.minimumValue = 0.0
    }

//}
//extension UIColor {
//    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
//        var red: CGFloat = 0
//        var green: CGFloat = 0
//        var blue: CGFloat = 0
//        var alpha: CGFloat = 0
//        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
//
//        return (red, green, blue, alpha)
//    }
}
