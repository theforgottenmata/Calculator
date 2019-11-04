//
//  ViewController.swift
//  Calculator
//
//  Created by Máťa Slábek on 03/11/2019.
//  Copyright © 2019 Máťa Slábek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Int = 0;
    var previousNumbers:Int = 0;
    var calculating = false
    var operation = 0;
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func Numbers(_ sender: UIButton) {
        
        if calculating == true{
            label.text = String(sender.tag-1)
            numberOnScreen = Int(label.text!)!
            calculating = false
        }else{
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Int(label.text!)!
        }
        
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if sender.tag != 11 && sender.tag != 16{
            
            previousNumbers = Int(label.text!)!
            
            if sender.tag == 12{ //deleno
                label.text = "/"

            } else if sender.tag == 13{ //násobení
                label.text = "*"

            } else if sender.tag == 14{ // odčítaní
                label.text = "-"

            } else if sender.tag == 15{ // sčítaní
                label.text = "+"
            }
            calculating = true
            operation = sender.tag
            
        }else if sender.tag == 16{
            
            if operation == 12 {
                label.text = String(previousNumbers / numberOnScreen)

            }else if operation == 13{
                label.text = String(previousNumbers * numberOnScreen)

            }else if operation == 14{
                label.text = String(previousNumbers - numberOnScreen)

            }else if operation == 15{
                label.text = String(previousNumbers + numberOnScreen)
            }
            
        }else if sender.tag == 11{ //AC
            label.text = ""
            previousNumbers = 0
            numberOnScreen = 0
            operation = 0
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        // Do any additional setup after loading the view.
    }


}

