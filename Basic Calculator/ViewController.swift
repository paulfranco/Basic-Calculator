//
//  ViewController.swift
//  Basic Calculator
//
//  Created by Paul Franco on 8/8/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var isPerformingOperation: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
    }

    @IBAction func numberPressed(_ sender: Any) {
        guard let tag = (sender as? UIButton)?.tag else {
            return
        }
        
        if isPerformingOperation == true {
            isPerformingOperation = false
            resultLabel.text = String(tag - 1)
        } else if let text = resultLabel.text {
            resultLabel.text = text + String(tag - 1)
        }
        
        if let resultText = resultLabel.text, let numOnScreen = Double(resultText) {
            numberOnScreen = numOnScreen
        }
        
        
    }
    
    @IBAction func operatorPressed(_ sender: Any) {
        
        guard let tag = (sender as? UIButton)?.tag else {
            return
        }
        
        // clear
        if tag == 16 {
            resultLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            return
        }
        // 11 -> division | 12 -> multiplication | 13 -> subtraction | 14 -> addition | 17 -> percentage
        if (tag == 11 || tag == 12 || tag == 13 || tag == 14 || tag == 17) {
            operation = tag
            isPerformingOperation = true
            previousNumber = Double(resultLabel.text!)!
            
            if tag == 11 {
                resultLabel.text = "/"
                
            } else if tag == 12 {
                resultLabel.text = "x"
                
            } else if tag == 13 {
                resultLabel.text = "-"
                
            } else if tag == 14 {
                resultLabel.text = "+"
            } else if tag == 17 {
                resultLabel.text = "%"
            }
        } else if tag == 15 {
            isPerformingOperation = true
            if operation == 11 {
                resultLabel.text = String(previousNumber / numberOnScreen)
            } else if operation == 12 {
                resultLabel.text = String(previousNumber * numberOnScreen)
            } else if operation == 13 {
                resultLabel.text = String(previousNumber - numberOnScreen)
            } else if operation == 14 {
                resultLabel.text = String(previousNumber + numberOnScreen)
            } else if operation == 17 {
                resultLabel.text = String(numberOnScreen / previousNumber)
            }
        }
    }
    
}

