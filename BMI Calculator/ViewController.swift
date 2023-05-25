//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Shatha Naami on 15/05/2023.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2fm", sender.value)
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = String(format: "%.0fKg", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(weight, height)
        
        let bmiValue = calculatorBrain.getBMIValue()
        let bmiAdvice = calculatorBrain.getAdvice()
        let bmiColor = calculatorBrain.getColor()
        
        let flutterEngine = ((UIApplication.shared.delegate as? AppDelegate)?.flutterEngine)!;
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil);
        self.present(flutterViewController, animated: true, completion: nil)
        
        let bmiDataChannel = FlutterMethodChannel(name: "com.shatha.bmi/data", binaryMessenger: flutterViewController.binaryMessenger)
        
        // com.floward.flora
        let jsonObject: NSMutableDictionary = NSMutableDictionary()
        jsonObject.setValue(bmiValue, forKey: "value")
        jsonObject.setValue(bmiAdvice, forKey: "advice")
        jsonObject.setValue(bmiColor, forKey: "color")
        
        var convertedString: String? = nil
        
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: jsonObject, options: JSONSerialization.WritingOptions.prettyPrinted)
            convertedString = String(data: data1, encoding: String.Encoding.utf8)
        } catch let myJSONError {
            print(myJSONError)
        }
        
        // floraAuthData
        bmiDataChannel.invokeMethod("fromHostToClient", arguments: convertedString)
        
    }

}
