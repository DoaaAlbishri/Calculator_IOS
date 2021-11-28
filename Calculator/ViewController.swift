//
//  ViewController.swift
//  Calculator
//
//  Created by Doaa Albishri on 28/11/2021.
//

import UIKit

class ViewController: UIViewController {
    var total: Double = 0
    var num1: Double = 0
    var num2: Double = 0
    
    var bool :Bool = false
    var op = ""
    var emp = "not empty "
    var zero = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var TotalLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if(bool == false){
            if(zero == 0){
                TotalLabel.text = sender.titleLabel!.text!
                zero = 2
            }else{
        TotalLabel.text = TotalLabel.text! + sender.titleLabel!.text!
            }
        total = Double(TotalLabel.text!)!
        num1 = Double(TotalLabel.text!)!
        }else{
            if(emp == ""){
            TotalLabel.text = sender.titleLabel!.text!
                emp = "not empty "
            }else{
            TotalLabel.text =  TotalLabel.text! + sender.titleLabel!.text!
            }
            num2 = Double(TotalLabel.text!)!
        }
    }

    @IBAction func operation(_ sender: UIButton) {
        let operation = sender.titleLabel?.text
        switch operation {
        case "/": TotalLabel.text = "/"
            op="/"
        case "X": TotalLabel.text = "X"
          //  emp = ""
            op="*"
        case "-": TotalLabel.text = "-"
            op="-"
          //  emp = ""
        case "+": TotalLabel.text = "+"
            op="+"
          //  emp = ""
        case "=":
            switch op{
            case "/": TotalLabel.text = String((num1/num2))
                total =  Double(TotalLabel.text!)!
                num1 = total
            case "*": TotalLabel.text = String((num1*num2))
                total =  Double(TotalLabel.text!)!
                num1 = total
            case "-": TotalLabel.text = String((num1-num2))
                total =  Double(TotalLabel.text!)!
                num1 = total
            case "+": TotalLabel.text = String((num1+num2))
                total =  Double(TotalLabel.text!)!
                num1 = total
            case "%":
                TotalLabel.text = String(num1/100)
            default: print("error")
            }
            bool = false
            return
        default: print("error")
        }
        bool = true
        emp = ""
    }
    
    
    @IBAction func advanceOperation(_ sender: UIButton) {
        let operation = sender.titleLabel?.text
        switch operation{
        case "C":TotalLabel.text = "0"
            total=0
            num1=0
            num2=0
            zero = 0
            bool = false
            return
        case "%": TotalLabel.text = TotalLabel.text! + "%"
            op = "%"
        case "+/-":
            let num = Double(TotalLabel.text!)!
            TotalLabel.text = String(num * -1)
            if(num1 == num){
                num1 = num * -1
            }else{
              num2 = num * -1
            }
        default:print("error")
        }
    }
    
}

