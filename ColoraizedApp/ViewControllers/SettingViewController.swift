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
    
    //MARK: Public Properties
    var delegate: SettingViewControllerDelegate!
    var colorisedView: UIColor!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        colorView.backgroundColor = colorisedView
        
        setValue(for: redColorSlider, greenColorSlider, blueColorSlider)
        setValue(for: redColorValue, greenColorValue, blueColorValue)
        setValue(for: redColorTF, greenColorTF, blueColorTF)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - IBActions
    @IBAction func rgbSlider(_ sender: UISlider) {
        switch sender {
        case redColorSlider:
            setValue(for: redColorValue)
            setValue(for: redColorTF)
        case greenColorSlider:
            setValue(for: greenColorValue)
            setValue(for: greenColorTF)
        default:
            setValue(for: blueColorValue)
            setValue(for: blueColorTF)
        }
        setColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}
    
//MARK: Private Methods
extension SettingViewController {
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1
        )
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
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redColorValue: label.text = getString(from: redColorSlider)
            case greenColorValue: label.text = getString(from: greenColorSlider)
            default: label.text = getString(from: blueColorSlider)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redColorTF: textField.text = getString(from: redColorSlider)
            case greenColorTF: textField.text = getString(from: greenColorSlider)
            default: textField.text = getString(from: blueColorSlider)
            }
        }
    }

    private func getString(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//MARK: - UITextFieldDelegate
extension SettingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case redColorTF:
                redColorSlider.setValue(currentValue, animated: true)
                setValue(for: redColorValue)
            case greenColorTF:
                greenColorSlider.setValue(currentValue, animated: true)
                setValue(for: greenColorTF)
            default:
                blueColorSlider.setValue(currentValue, animated: true)
                setValue(for: blueColorTF)
            }
            setColor()
            return
        }
        showAlert(title: "Error!", message: "Please enter correct value")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolBar = UIToolbar()
        keyboardToolBar.sizeToFit()
        textField.inputAccessoryView = keyboardToolBar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        keyboardToolBar.items = [flexBarButton, doneButton]
    }
}


