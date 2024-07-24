//
//  ViewController.swift
//  ImcApp-IOS
//
//  Created by Mañanas on 22/7/24.
//

import UIKit

class HomeViewController: UIViewController {

  
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightStepper: UIStepper!
    
    @IBOutlet weak var Results: UILabel!
    @IBOutlet weak var messageWeight: UILabel!
    
    var height : Int = 160
    var weight : Float = 70

    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightLabel.text = "\(height)cm"
        weightLabel.text = String(format: "%.1fkg", weight)
    
       
    }

    @IBAction func onHeightChanged(_ sender: UIStepper) {
        height = Int(sender.value)
        heightLabel.text = "\(height)cm"
    }
    @IBAction func onWeightChanged(_ sender: UISlider) {
        weight = sender.value
        weightLabel.text = String(format: "%.1fkg", weight)
        
    }
    @IBAction func calculateBottom(_ sender: Any) {
        updateIMC()
    
    }
    
    func updateIMC() {
           let heightInMeters = Float(height) / 100.0
           let imc = weight / (heightInMeters * heightInMeters)
           Results.text = String(format: "Results: %.2f", imc)
        
        
        var message = ""
        var color = UIColor.black
        switch imc {
        case 0..<18:
            message = "Bajo de Peso"
            color = UIColor.blue
        case 18..<25:
            message = "Peso Normal"
            color = UIColor.green
        case 25..<30:
            message = "Sobrepeso"
            color = UIColor.orange
        case 30..<35:
            message = "Obesidad Ligera"
            color = UIColor.yellow
        case 35..<39:
            message = "Obesidad"
            color = UIColor.red
        default:
            message = "Haz ejercicio"
            color = UIColor.brown
        
        }
        Results.textColor = color
        messageWeight.text = message
        messageWeight.textColor = color
    }
}
    

